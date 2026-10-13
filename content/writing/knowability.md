---
title: "Knowability"
date: 2026-02-15
lastmod: 2026-10-13
type: writing
draft: false
description: "How systems preserve the connection between the rules they enforce and the outcomes they produce as they change and interact."
summary: "A system can keep working while our reasons for trusting it become harder to recover. Knowability is my way of thinking about what architecture has to preserve so we can still explain its behavior."
tags: ["Systems Thinking", "Architecture", "Observability"]
aliases:
  - /theory/knowability/
  - /theory/corpus/knowability/
---

A system can run reliably for years while becoming harder to explain. The outputs look right, the tests pass, and the people operating it know which failures to watch for. Then someone proposes a change, and a question that sounds small takes days to answer: what prevents this operation from happening twice?

That question interests me because it asks us to recover the reason the system can be trusted. There may be a constraint in the database, a rule in one service, or an assumption that callers will behave a certain way. Those give us very different grounds for making the change. We need to know which one we have, where it applies, and whether it still holds when another system joins the work.

I use **knowability** to mean the preserved ability of a system to justify its behavior through enforceable constraints across time and composition. In practical terms, I want to be able to follow an outcome back to the rules that governed it, show how those rules were enforced, and recover enough of the context to check that explanation later.

<!--more-->

## What the system has to preserve

Consider a service that records a credit against an account. The business rule is that one approved credit instruction must not increase the balance twice. That is an invariant: a property we expect to hold as the system moves through valid states. The architecture has to give that rule a concrete form.

A comment saying “do not process duplicates” records the intention. The implementation might enforce it by assigning each instruction a stable identity and allowing only one corresponding ledger entry. For that to work, the identity has to mean the same instruction wherever it travels, and every path that can post the credit has to respect the rule. A repair script that bypasses the check belongs in the analysis too.

The distinction matters when we investigate an outcome. Seeing one credit in an account tells us what happened on that occasion. Finding the instruction, the ledger entry, and the mechanism that prevented a second posting gives us a reason to expect the rule to hold under the conditions that mechanism covers.

That last qualification matters. We still have to establish the scope of the guarantee. A rule enforced inside one database does not automatically cover a second database or an external payment processor. An explanation becomes useful when it says where the guarantee ends as clearly as where it holds.

## What changes at a boundary

Now put another service in front of the ledger. It sends a credit instruction, waits for a response, and retries if the request times out. The ledger can commit the credit before the response is lost, leaving the caller uncertain about whether the operation succeeded.

An idempotent API can let the caller retry with the same request identifier without producing an additional effect. Within a database-backed implementation, recording that identifier and applying the mutation must be atomic; otherwise a failure can leave one recorded without the other. The [Amazon Builders' Library discussion of safe retries](https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/) explains those mechanics and the importance of distinguishing a repeated request from a new intention.

The architectural question is whether our two services preserve that meaning between them. If the caller creates a fresh identifier for every attempt, the ledger may correctly treat each request as a new instruction. Both components can behave according to their local contracts while the customer receives two credits for one approval.

We introduced a requirement by connecting the services: the identity of the business instruction must survive retries across that boundary. The ledger team cannot establish that by inspecting its uniqueness constraint alone. The caller team cannot establish it by showing that its retry policy eventually gets a successful response. Someone has to reason through the whole operation.

This is the difficulty I mean by composition. The guarantees of the parts have conditions attached to them, and connecting the parts can change whether those conditions hold. Ordering, timing, and the meaning of an identifier become part of the design. We have to make those requirements explicit and check that the implementation preserves them.

## What time takes away

The same problem appears as software changes. A library upgrade alters retry behavior. A migration changes the uniqueness rule. A new integration assigns identifiers differently. The architecture diagram can remain unchanged through all three.

To explain an older credit, we may need to know which version of the code ran, which configuration it used, and what the approval meant at that time. Looking at today's implementation can give us a precise explanation of a system that did not produce the outcome we are investigating.

Reproducibility helps preserve that connection. Versioned code and configuration, recorded schema changes, and evidence of the relevant inputs give us something we can return to. In a distributed system, we may not be able to replay every execution exactly. We should be explicit about what we can reconstruct, what we can test again, and which details were never retained.

A changed rule also needs an explanation. If the business starts allowing an instruction to produce several ledger entries, the old invariant may no longer be the right one. Preserving knowability means recording the new rule and establishing how the new design enforces it. Keeping an obsolete constraint would preserve the wrong behavior.

## The model and the running system

Our understanding of a system is always selective. A schema represents some of its rules. Types express others. Tests exercise particular cases. Documentation explains intention, and telemetry gives us evidence from executions. Each helps answer a different part of the question, and each leaves things out.

Trouble begins when we forget those limits. A test that exercises the normal request path may tell us nothing about concurrent retries. A diagram can show a single customer identifier while two services disagree about what it identifies. We can have a coherent model of the system and still be reasoning from an assumption that the implementation does not enforce.

I want those assumptions to remain visible. If we believe every caller preserves the credit instruction's identity, we should be able to say how we checked that, which callers we checked, and what would invalidate the conclusion. An unexamined integration should remain an open question in the design.

This makes knowability a matter of scope. I am not claiming that an engineer can hold a complete model of every possible behavior. I am asking whether we can support the particular claims on which a decision depends. For the credit example, that means understanding the paths that can affect the balance well enough to justify the rule we promise the business.

## Where observability helps

Observability gives us a way to investigate how those paths behave in production. In the credit example, useful evidence would connect the approval and its instruction identifier to the attempts to submit it, the service decisions, and the ledger entry. If that connection is missing, we may see that two credits occurred without being able to recover why.

That evidence can challenge our model. We may discover a caller we did not account for, a retry that changed the identifier, or a code path that bypassed the expected check. The result of the investigation should change what we believe about the system and, where necessary, what the system enforces.

Observing successful executions cannot establish that every possible execution is correct. Structural constraints also leave questions about their implementation and operating conditions that need evidence from the running system. I am interested in how those forms of reasoning support each other: the design gives us claims to investigate, and production gives us opportunities to discover where those claims are incomplete or wrong.

## Keeping the explanation usable

This is part of the daily work of architecture. When a boundary moves, I want to know which rules cross it and how they remain enforceable. When a dependency changes, I want to know which assumptions need checking again. When the business changes a rule, I want the people implementing it to understand what the new outcome is supposed to mean.

Reviews, documentation, and tests help us do that work, provided we can connect them to the mechanisms they describe. A completed review cannot substitute for a missing constraint. A constraint whose meaning nobody can recover is difficult to change safely. We need both the implementation and an explanation that engineers can inspect, challenge, and maintain.

For the engineer asked to change the credit workflow, the useful result is concrete. They can identify the rule, find where it is enforced, follow it across the caller and ledger, and see which evidence supports the explanation. They can name the assumptions their change affects and investigate those before relying on them. That gives them a basis for changing the system without depending on the memory of whoever happened to build it.
