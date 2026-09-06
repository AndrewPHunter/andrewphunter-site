---
title: "Agents Are Actors With Intent, Not Guarantees"
subtitle: "The actor model still applies. The assumptions about behavior do not."
date: 2026-03-17
description: "AI agents are not a new category of system. They are actors with inference where the decision used to be, which reintroduces familiar distributed systems problems under probabilistic behavior."
type: application
category: applications
tags: ["AI Systems", "Agents", "Distributed Systems", "Software Architecture"]
---

I was at dinner with one of the people who wrote the book on the actor model, over Chinese food, one of his favorites, when he asked me what an agent was.

I had been turning the question over for a while, and the honest answer came out plainly: it is an actor, with inference where the decision used to be. The answer stayed with me, because the more I looked at it, the more precise it turned out to be.

<!--more-->

## The answer holds

The actor model has described this shape for decades. An actor observes its environment, decides what to do, acts within a boundary, and coordinates with other actors doing the same. That is also what everyone now means by an agent. We have built systems of interacting decision-makers for years without calling them new: a payment service evaluates a transaction and decides whether to authorize it, a retry worker observes failure state and decides whether to reprocess a job, a fraud system reads activity and triggers downstream work. Each operates on partial information, affects shared state, and interacts with others doing the same.

We have the vocabulary for these systems and the patterns to build them: idempotency, message boundaries, retry strategies, coordination, observability. So an agent is not a new category of system. It is a familiar one that already has a name in the literature. It is an actor.

## The one thing that changed

A classic actor is deterministic. Given the same input and state it produces the same outcome, which is what lets you test it and rely on it while it coordinates with everything around it. Put inference inside the actor and that stops being true. The decision is now probabilistic: sensitive to context you cannot fully see, capable of different outcomes under similar conditions, and hard to explain after the fact.

Nothing else about the system changed. The structure is the same, the coordination model is the same, the actor still observes and decides and acts. Only the core of the actor moved, from a fixed function to an inferred one. That is the whole of what "agentic" adds, and it is enough to matter, because the thing you used to be able to rely on is the thing that is now variable.

## What that breaks

The change propagates outward into problems that are not new but are now harder to contain. An agent retries an action and produces a different result. A workflow runs twice because the system cannot tell whether the previous step finished. Two components make conflicting decisions from slightly different views of state. A downstream system cannot explain why a decision was made, because the reasoning lived in a model rather than in code.

These are the classic distributed-systems failures: coordination under partial information, idempotency and safe retries, consistency across boundaries, observability of decision paths, ownership of authority. What changed is not the category of problem. It is that retries no longer converge and identical inputs no longer guarantee identical outcomes. The old patterns still apply; they simply have less to hold onto, because they were designed around actors whose behavior was stable.

## Where the work is

Most effort goes into the agent itself: prompt design, model selection, tool integration, chaining. That work matters, but it is not where production failures come from. They come from the boundary, and the boundary now has to supply the determinism the actor gave up.

Constrain what the agent is permitted to do, and enforce it outside the agent, at a deterministic boundary it cannot talk its way past. Validate every action before it executes rather than trusting the decision that produced it. Keep authority over state changes outside the agent, so a probabilistic component never holds an irreversible permission on its own. Record each decision in a form you can reconstruct later, because you cannot replay the model to explain it. And make failure detectable and reversible, so a bad action is caught and its authority withdrawn before it compounds. The difficulty was never making the agent capable. It is building a system that can safely contain a capable actor whose behavior you can no longer predict.

## Back to the question

The word "agent" suggests something without precedent. The more useful answer is older and less exciting: it is an actor, with inference where the decision used to be. Name it that way and you inherit forty years of knowledge about systems of interacting actors, and you see exactly what is new and what is not. What is new is that you can no longer trust the actor to behave the same way twice, so the responsibility for its behavior moves to the system that contains it. That is not a limitation of today's models, it is their nature.
