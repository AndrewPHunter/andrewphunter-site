---
title: "Architecture as Practice"
date: 2020-07-20
series: corpus
description: "Good architecture is not about frameworks or diagrams. It is a set of practiced constraints that shape how software systems evolve, scale, and remain changeable over time."
---

*This essay is adapted from an internal architecture memo I wrote in 2020. It has been lightly edited for public release.*

Programming is fundamentally an exercise in problem solving. The act of programming is the act of managing complexity.

As systems grow, architecture is introduced not as ceremony, but as a way to define the problem space and provide the creative constraints necessary to balance business requirements with long-term sustainability. Good architecture is not about frameworks or languages. It is about establishing a cohesive set of principles and practices that guide how problems are solved over time.

Over time, I’ve come to understand that what these practices ultimately preserve is not elegance or flexibility in the abstract, but **knowability**. Knowability is the property of a system by which the relationship between its constraints, decisions, and outcomes remains internally representable and externally recoverable over time. A knowable system can justify its behavior without appeal to historical coincidence, intuition, or post-hoc interpretation. Its correctness is not inferred from outcomes, but demonstrated through enforced constraints that preserve causal traceability as the system evolves.
The architectural properties that follow are best understood as constraints that preserve knowability under different forms of pressure.

Over the years, I’ve found that effective software architecture can be usefully described by five enduring properties. Together, they form a practical, experience-driven model for building systems that survive contact with reality:

**Scalable. Maintainable. Accessible. Reproducible. Testable.**

Not as buzzwords. As operating principles.
Each addresses a different way systems lose knowability as they grow, change, or come under pressure.

<!--more-->

## Scalable

Not every system needs to handle “Facebook scale.” But every system should be written with the ability to scale without requiring fundamental rewrites.

At its core, scalability is about avoiding unnecessary coupling and blocking. This often shows up in:

- Asynchronous and non-blocking execution models  
- Proper use of concurrency and threading  
- Minimizing data transformation in read paths  
- Using patterns like CQRS or predefined query models  
- Introducing messaging, queues, or pub/sub where appropriate for medium and large systems

Scalability is not something you bolt on later. It is a consequence of early decisions about boundaries, flow, and responsibility. While it is often framed in terms of throughput, its deeper role is epistemic: ensuring that growth does not destroy the system’s ability to explain its behavior in terms of its original constraints.

## Maintainable

Software is called “soft” for a reason. If requirements never changed, we wouldn’t need software engineers — we’d be building hardwired systems.

All software should be written with change in mind. The difficulty of making a change should be proportional to the *scope* of the change, not the *shape* of it.

This is usually achieved through:

- Clear separation of concerns  
- Dependency inversion  
- Encapsulation of behavior  
- Layered or onion-style architectures  
- Relentless application of the Single Responsibility Principle  

Every compilation unit should have one business reason to change. When this is not true, complexity accumulates invisibly — until it becomes the dominant cost of the system.

Maintainability preserves knowability over time by keeping reasoning local. When changes propagate non-locally, explanation degrades before behavior does.

## Accessible

Programming is the act of expressing problem-solving through code.

> Programming is for humans. Binary is for computers.

Modern compilers and runtimes are far better at optimization than we are. We should use that to our advantage by expressing intent clearly and allowing the machine to handle execution details.

Accessibility is the condition that preserves intent as systems evolve. It is not about ease of use or surface clarity, but about whether the reasons a system exists, the constraints it encodes, and the decisions it makes remain legible over time.

That implies:
- Prefer clarity over cleverness
- Prefer declarative styles over imperative ones where possible
- Avoid pre-optimization that obscures intent
- Isolate necessary complexity rather than spreading it

These are not stylistic preferences. They are architectural constraints on how intent is preserved.

Accessibility manifests structurally in how intent is carried through the system. When intent is preserved, it remains visible at every level of decomposition. When it is lost, understanding requires reconstruction.

In accessible systems:
- responsibilities are explicit rather than implied,
- decision points are localized rather than scattered,
- abstractions communicate why they exist, not just how they behave,
- complexity is contained rather than diffused across layers.

The goal is not minimal code or stylistic purity. The goal is intention-revealing structure — structure that allows decisions to be explained directly, without reverse-engineering behavior or inferring purpose after the fact.

When intent is preserved, systems remain accessible under change and pressure. When it is not, explanation collapses. Behavior can still be observed, but the reasoning that produced it must be inferred after the fact.

Accessibility is what prevents observability from degrading into post-hoc interpretation. **Without it, correctness may still exist, but it can no longer be reliably explained.**

## Reproducible

“It works on my machine” is not a success condition.

Reproducibility is not about convenience or determinism for its own sake. It is the condition that allows correctness to be demonstrated rather than assumed.

A system is reproducible if the relationship between its constraints and its outcomes can be re-established. Reproducibility ensures that explanations survive context shifts. Without it, correctness may still exist, but it cannot be reliably re-established when conditions change. When this relationship holds, behavior can be questioned, explained, and revised. When it does not, correctness can only be inferred from results.

In practice, this requires that systems be both build-time and run-time deterministic with respect to their constraints.

That means:
- Configuration via explicit inputs, not ambient environment state
- No hidden dependencies on machine setup or deployment context
- Clear separation between code and environment
- All environment-specific behavior expressed through well-defined boundaries

These are not operational preferences. They are architectural requirements. Without them, a system may function reliably, but it cannot explain why it behaves as it does.

## Testable

Testability is often discussed as a development convenience: the ability to verify behavior, catch regressions, and change code safely. These are real benefits, but they are downstream effects, not the core purpose.

The primary role of testability is to make correctness enforceable. Testability is the mechanism by which knowability becomes enforceable rather than aspirational.

In any non-trivial system, many behaviors are plausible, coherent, and operationally successful while still being wrong. Architecture exists to constrain that space. Tests are the mechanism by which those constraints are asserted. They define which behaviors are not allowed, not merely which behaviors have been observed.

This is why testability is an architectural concern rather than a procedural one. If a system cannot express and enforce its constraints in a way that can be mechanically checked, then correctness is left to convention, review, or intuition. Those mechanisms may work for a time, but they do not scale, and they do not survive pressure.

Good test design is therefore not about coverage or completeness. It is about encoding invariants. A small number of tests that assert what must never happen provide more architectural value than a large suite that merely confirms that something happened.

This framing also explains why testability depends so strongly on other architectural choices. Clear separation of concerns, dependency inversion, and explicit boundaries are not stylistic preferences. They are what make it possible to state constraints precisely and enforce them reliably.

When systems are testable in this sense, change becomes safe not because behavior can be rechecked after the fact, but because invalid behavior is structurally excluded. The system does not need to infer correctness from outcomes; it is constrained to produce correct outcomes by design.

## Architecture as Practice

These five properties are not theoretical. They are not aspirational. They are practical constraints that shape day-to-day engineering decisions.

Good architecture is not something you “do” once. It is something you **practice continuously**.

What ultimately distinguishes durable systems is not cleverness, but their ability to remain knowable as reality applies pressure.

They remain understandable because intent and constraints stay legible over time. They remain changeable because reasoning is local and proportional to the scope of change. They remain operable because behavior can be explained rather than inferred from outcomes. And they remain honest about their own complexity because limits are enforced rather than obscured.

Good architecture is not something you “do” once. It is something you practice continuously—the ongoing discipline of preserving knowability as systems evolve, scale, and encounter reality.

