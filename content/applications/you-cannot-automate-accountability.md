---
title: "You Cannot Automate Accountability"
date: 2026-09-02
draft: true
description: "An incident review correctly diagnoses a governance and accountability failure, then prescribes an agentic solution that fixes none of it. Read the directive as evidence."
type: application
category: applications
tags: ["AI Governance", "Enterprise Risk", "Operating Models", "Revenue Assurance"]
---

<!--
SKETCH for later. draft: true. Standalone essay — NOT part of Governance Under Scale or Transformation
Under Scale. Voice = locked article standard (memory `article-voice`): impersonal-authoritative, author
as judge, light strategic "I" only at the frame; a concrete lived example may go first person.

WORKING TITLE "You Cannot Automate Accountability." Alternatives: "The Agentic Reflex", "An Agent Won't
Build Your Test Lab", "Nobody Owned It", "Accepted".

*** GENERICIZATION / POSITIONING — read before drafting ***
Source is a real internal directive from Andrew's own CIO. This piece critiques that directive. The scrub
must be airtight and the target must be the REFLEX/PATTERN, never a person:
- No names (no Kannan / Amy / Radhika). No company. No product name ("LEAD app").
- Dollar figure as order-of-magnitude ("millions" / "a few million"), never "$2-3M".
- The failing feature stays generic: "a usage-control / metering / throttling feature."
- Sector context (a telecom carrier) may stay; it identifies an industry, not an employer.
- Frame it as a pattern specimen, not "my CIO said." If it is recognizable, it is career-shaped, not just
  risky. Confirm positioning with Andrew before publishing.

THE THESIS (agreed): the directive is self-refuting. Every cause it lists is a process / instrumentation /
accountability failure; the prescription is an agentic solution that fixes none of them. Revenue assurance
is a decades-old, solved telecom discipline; the controls were missing because no one OWNED them, not
because the tech was not ready. "We have accepted them" is the confession — a governance/accountability
failure named by the person issuing the directive. Reaching for AI over ownership is the same reflex that
let the gaps be accepted in the first place. Read the directive as evidence, not as a plan.
-->

<!--
INTRO (no header)
- Hook: a usage-control feature failed silently for two months and leaked millions, and the thing that
  finally detected it was the one person who cannot delegate noticing — the CEO. If the CEO is your
  monitoring system, you do not have one.
- Turn: a directive followed the incident, and the directive is the interesting artifact. It diagnoses the
  failure correctly and then prescribes a fix that addresses none of the diagnosis. Read it as evidence.
- Plant the thesis in a line: you cannot automate accountability, and this is a directive trying to.
-->

<!--more-->

## The diagnosis is right, and it is boring
<!--
- Walk the actual causes the review found, all mundane, all real: estimation-driven corner-cutting, weak
  test environments, thin testing methods, no device-level test lab, and the load-bearing one — state
  desync between what the customer-facing app claims and what the device (and the bill) actually enforce.
- Make the point: not one of these is a model problem. Every one is process or instrumentation. This is a
  correct diagnosis of an unglamorous engineering-discipline failure.
-->

## The prescription answers none of it
<!--
- The directive: build an agentic revenue-assurance solution. Walk the mismatch cause by cause — an agent
  does not build a device test lab, does not fix an estimate, does not stand up a test environment, does
  not run the reconciliation. Five failures named; a sixth thing proposed that fixes zero of them.
- And revenue assurance is not a frontier waiting on AI. It is a decades-old telecom discipline;
  reconciliation controls predate "agentic" by thirty years. The control that would have caught this
  already exists as a practice. It was not missing because the technology was not ready.
-->

## "Accepted" is an accountability word
<!--
- The real diagnosis is in the directive's own sentence: "these are systemic issues that have existed and
  we have accepted them." That is not a technology sentence; it is an accountability sentence.
- Unpack "accepted": someone, repeatedly, decided not to fix them, and no one was answerable for that
  decision. The controls were missing because no one owned them. The money walked until the only person
  who cannot delegate noticing noticed. Detection had no owner either — that is why it escalated to the top
  instead of tripping a control.
- The blunt line: you cannot deploy an owner. AI can assist a control; it cannot be accountable for one.
-->

## Speed is not a testing strategy
<!--
- The tell that seals it: "5-day sprints" bolted onto the directive. The fix for insufficient verification
  is now faster delivery.
- Faster delivery of unverified changes is not a fix. It is the same leak, shipped quicker. Velocity
  copied from other teams as a goal, when the failure was a lack of the thing velocity trades away.
-->

## The reflex is the disease
<!--
- Step up a level: reaching for an agentic solution to a problem correctly diagnosed as process,
  instrumentation, and ownership is not solving it. It is the same reflex that let the gaps be "accepted"
  in the first place — choosing the glamorous new thing over owning the boring old one.
- The prescription repeats the pathology it is meant to cure. (Ties to Andrew's standing critique: prophets
  and cooks reaching for AI where an engineer would reach for a control and an owner.)
-->

## Closing
<!--
- The unglamorous fix, stated plainly: name an owner, staff the controls, run the reconciliation that has
  existed for decades, and make detection someone's job so it never has to reach the CEO again.
- Automate the reconciliation afterward if you like — but automation of an unowned control is only a faster
  way to not notice. Ownership was the missing thing, and no agent supplies it.
- Definitive last line tying "you cannot automate accountability" to the incident. No gotcha.
-->
