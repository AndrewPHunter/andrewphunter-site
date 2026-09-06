---
title: "When Inference Becomes Control"
subtitle: "Why Observability Becomes Rationalization"
date: 2026-01-24
draft: false
description: "The late-2025 fix for an unreliable agent was more agents. But you cannot monitor your way to control over a system that runs on inference, because inference discards the evidence monitoring depends on."
type: application
category: applications
tags: ["AI Systems", "Observability", "Governance", "Software Architecture"]
---

By the end of 2025, the fix for an unreliable agent had a shape, and the shape was more agents. The diagrams were everywhere: a supervisor agent checking a worker, an evaluator scoring the supervisor, an optimizer tuning the evaluator, an observability layer watching all of it. A single agent could not be trusted, so the answer was a committee of them.

It looks like sophistication. It is compensation, and it makes the problem worse.

<!--more-->

The tell is not the number of AI components. It is the direction of control flow. When a system's correctness depends on downstream inference correcting or interpreting upstream inference, control is no longer exercised through structure and constraint. It has been deferred to interpretation after the fact, and interpretation after the fact is exactly what inference cannot be trusted to do.

## Inference destroys the evidence

Start with what inference is. An inference system produces an output by collapsing many possible states into fewer likely ones. That is not a flaw in current models; it is the job. A system that preserved every possibility would not be inferring anything.

The consequence is that information is lost at every step, by design. Context is dropped, ambiguity is resolved to a guess, alternatives are discarded. Nothing downstream can recover what an earlier step threw away. So stacking inference on inference does not average the error out. It compounds it. Each layer discards information the next one needs, and the loss is non-linear: the more inference you add to supervise inference, the less any of it can be reconstructed. A more capable model does not fix this. It collapses the state faster and more convincingly.

## Adding intelligence where constraint is missing

This is why the committee of agents fails. What an unreliable agent lacks is not intelligence. It is constraint: the boundaries that decide what the system is allowed to do before it does it. Adding a second agent to watch the first adds more inference, not more constraint, and inference was the unreliable part to begin with.

Underneath the diagrams, a quieter shift has happened. Constraints have moved from preconditions to afterthoughts. Instead of bounding what the system may do, teams evaluate what it did. Review becomes sampling. Accountability becomes statistical. Correctness stops being something established by intent and constraint and becomes something inferred from aggregate behavior across opaque components. Output keeps rising while the ability to say why the system did what it did quietly drains away.

## Observability becomes rationalization

Classical observability works on a bargain. Deterministic systems lose information in predictable ways, and logs, metrics, and traces are projections of state that actually existed. They can be noisy or incomplete, but they are not invented. When something breaks, you reconstruct what happened and intervene.

Inference-mediated systems break the bargain. By the time you go looking, the state was already discarded by design. So AI-observability tooling does something subtly different from observing: it reads prompts, scores, and traces and produces a plausible account of what the system must have been doing. That account is not a projection of real state. It is a reconstruction assembled from fragments, a story with the shape of an explanation, and it reads well precisely because a model wrote it.

The dashboards look familiar, but the ground has shifted. You are no longer inspecting the system. You are reading a narrative about it, and a narrative cannot be intervened on. You can monitor a system like this. You cannot govern it, because governing requires knowing what happened, and that is the one thing the architecture threw away.

## Control comes before inference

The alternative is not better instrumentation. No amount of it recovers information that was never preserved. Control has to be imposed before inference runs, as constraint, because it cannot be recovered afterward.

Put constraints before generation, not after it. An invariant enforced as a precondition makes an invalid state impossible; an evaluator applied afterward only samples for the states you failed to prevent. The first is control. The second is hope with a dashboard.

Keep control flow deterministic. Let inference inform a decision, but never let it mediate one: the step that changes state, grants authority, or commits a result stays in code you can read and replay. Inference can propose; structure disposes.

The test is unforgiving. If you cannot say why the system did what it did without invoking another inference to tell you, control has already left your hands. The answer to an agent you cannot trust was never a second agent to watch it. It was the constraint you skipped the first time.
