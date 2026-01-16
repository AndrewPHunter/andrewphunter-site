---
title: "Reproducibility Is How We Know Things Are True"
date: 2024-05-09
description: "Reproducibility is not a testing concern or an infrastructure detail. It is how we know a system is behaving as we believe it is, and whether change is safe."
---
*This essay is adapted from an internal architecture memo I wrote in 2024. It has been lightly edited for public release.*

Software is called “soft” for a reason. If requirements never changed, we wouldn’t need software engineers at all — we’d build hardwired systems and be done with it.

The defining property of software is change. Because change is inevitable, the defining responsibility of software design is to make change safe.

When change is unsafe, teams compensate with caution, ceremony, or heroics. Velocity slows, confidence erodes, and eventually the system becomes something people are afraid to touch. At that point, the problem is rarely effort or talent. It is that the system no longer behaves in ways anyone can reliably predict.

Reproducibility sits at the center of this problem, but it is often misunderstood. It is treated as a testing concern, an infrastructure concern, or a CI concern. In reality, reproducibility is more fundamental: it is how we know what a system is actually doing, and whether it is behaving as we believe it is.

Without reproducibility, change is guesswork.

<!--more-->

## Change Without Structure Is Guessing

All change carries risk, but that risk should scale with the *scope* of the change, not its *shape*. A small, localized change should have small, localized effects. When that relationship breaks down, something is wrong with the system’s structure.

Poorly structured systems produce non-local effects. Seemingly simple changes ripple across unrelated areas. Behavior shifts in places no one expected to touch. These effects are rarely obvious at the moment the change is made and often surface later, under load or in production, when the original context has already been lost.

When behavior is non-local, it becomes hard to reason about. When it is hard to reason about, it becomes hard to predict. And when behavior cannot be predicted, it cannot be reliably reproduced.

This is why reproducibility failures usually begin long before a test ever runs. They start when concerns are not clearly separated, when responsibilities blur, when dependencies are implicit, and when boundaries are treated as conveniences instead of constraints. The system may still “work,” but it no longer behaves in a way engineers can confidently explain.

At that point, testing becomes an attempt to compensate for structural ambiguity. Sometimes it succeeds. Often it does not.

## Tests Are for Control, Not Confidence

Tests are often discussed in terms of coverage, speed, or quantity. None of those are the point.

The purpose of a test is control.

A useful test constrains behavior. It makes expectations explicit. It ensures that when something changes, the resulting behavior is either intentional or visible. A test that merely passes does not provide knowledge; it only shows that something happened to line up once.

This is why flaky tests are so damaging. A test that passes sometimes and fails other times does not merely slow teams down — it destroys trust. It signals that behavior depends on factors engineers do not fully understand. In that situation, a green build is not evidence of correctness; it is coincidence.

Reproducibility is what distinguishes the two.

If a test cannot be run repeatedly and produce the same result given the same inputs, it cannot be relied on as a signal. If behavior varies based on timing, ordering, hidden state, or environment quirks, the test suite becomes noise. At best, it creates drag. At worst, it creates false confidence.

Tests are valuable only insofar as they make behavior deterministic and observable. Anything else is theater.

## Determinism Is a Design Constraint

Non-determinism rarely enters systems through tests. It enters through design.

Hidden state, implicit configuration, ambient context, and loosely controlled dependencies introduce behavior that varies in ways engineers cannot directly see. The system may still appear to function, but its behavior becomes contingent on factors that are neither explicit nor constrained.

This is why disciplines like separation of concerns, explicit state, dependency inversion, and encapsulation matter. Not because they are aesthetically pleasing, but because they limit the number of variables that can influence behavior at any given point.

Pure functions are easier to reason about because their outputs depend only on their inputs. Explicit state transitions are safer because they make change visible. Strong typing reduces ambiguity about what a system can accept and produce. Abstractions help when they isolate volatility and make dependencies explicit.

These are not style preferences. They are mechanisms for preserving determinism.

When behavior can be explained, it can be tested. When it can be tested, it can be reproduced. And when it can be reproduced, change becomes safer.

## Environment Is Part of the System

Reproducibility breaks down quickly when environment is treated as an external concern.

A system that behaves differently on a developer’s machine, in CI, and in production is not exhibiting three versions of the same behavior. It is exhibiting three different behaviors. Phrases like *“works on my machine,”* version skew between environments, and bugs caused by implicit configuration are not accidents — they are signals that the system’s behavior depends on context that has not been made explicit.

Treating one environment as “special” does not solve the problem; it hides it.

CI is not a proving ground. Local development is not an exception. Production is not an excuse. If behavior depends on where the code happens to run, then the system is incomplete.

Environment includes runtime configuration, dependency resolution, build tooling, and deployment assumptions. If those factors are not controlled, documented, and reproducible, then neither is the system’s behavior.

A system that only works in one environment is not correct. It is fragile.

## Reproducibility Is Epistemology

At its core, reproducibility is not about tooling or process. It is about knowledge.

It is how we distinguish correctness from luck. How we separate behavior we understand from behavior that merely appears to work. How we make change intentional instead of accidental.

Without reproducibility, velocity becomes risk. Governance collapses into guesswork. Confidence degrades into hope.

With reproducibility, systems become understandable. Change becomes safer. Teams can move quickly without lying to themselves about what their software is actually doing.

That is why reproducibility matters — not as a best practice, but as the foundation for building systems that are meant to last.
