---
title: "Architecture as Practice"
date: 2020-07-20
description: "Good architecture is not about frameworks or diagrams. It is a set of practiced constraints that shape how software systems evolve, scale, and remain changeable over time."
---

*This essay is adapted from an internal architecture memo I wrote in 2020. It has been lightly edited for public release.*

Programming is fundamentally an exercise in problem solving. The act of programming is the act of managing complexity.

As systems grow, architecture is introduced not as ceremony, but as a way to define the problem space and provide the creative constraints necessary to balance business requirements with long-term sustainability. Good architecture is not about frameworks or languages. It is about establishing a cohesive set of principles and practices that guide how problems are solved over time.

Over the years, I’ve found that effective software architecture can be usefully described by five enduring properties. Together, they form a practical, experience-driven model for building systems that survive contact with reality:

**Scalable. Maintainable. Accessible. Reproducible. Testable.**

Not as buzzwords. As operating principles.

<!--more-->

## Scalable

Not every system needs to handle “Facebook scale.” But every system should be written with the ability to scale without requiring fundamental rewrites.

At its core, scalability is about avoiding unnecessary coupling and blocking. This often shows up in:

- Asynchronous and non-blocking execution models  
- Proper use of concurrency and threading  
- Minimizing data transformation in read paths  
- Using patterns like CQRS or predefined query models  
- Introducing messaging, queues, or pub/sub where appropriate for medium and large systems  

Scalability is not something you bolt on later. It is a consequence of decisions made early about boundaries, flow, and responsibility.

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

## Accessible

Programming is the act of expressing problem-solving through code. Code is not written for machines. Machines execute it. Humans read it.

> Programming is for humans. Binary is for computers.

Modern compilers and runtimes are far better at optimization than we are. We should use that to our advantage.

- Prefer clarity over cleverness  
- Prefer declarative styles over imperative ones where possible  
- Avoid pre-optimization that obscures intent  
- Isolate necessary complexity rather than spreading it  

Functions and methods should be small, cohesive, and decomposed to minimize branching logic. The goal is not brevity. The goal is **readable, intention-revealing structure**.

## Reproducible

“It works on my machine” is not a success condition.

Programs should be both build-time and run-time deterministic.

That means:

- Configuration via explicit inputs, not ambient environment state  
- No hidden dependencies on machine setup or deployment context  
- Clear separation between code and environment  
- All environment-specific behavior expressed through well-defined boundaries  

If a system behaves differently depending on where it runs, that is not an operational problem. It is an architectural one.

## Testable

Testing is not about coverage metrics. It is about **control and feedback**.

At its core, a unit test is just a small program that executes some logic and checks the result.

### Test-Aided Development

The most effective use of tests is not religious TDD, and not “write tests at the end.” It is simpler and more pragmatic:

> Any time you feel the urge to press F5 to see if something works, write a test instead.

A test lets you:

- Bypass the entire application  
- Execute the logic directly  
- Control inputs precisely  
- Observe outputs deterministically  

When code is hard to test, that usually indicates a **design problem**, not a testing problem.

With proper use of dependency inversion, pure functions, and functional decomposition, the majority of a codebase should be trivially testable. In this way, tests become:

- A design feedback mechanism  
- A safety harness for change  
- A guardrail for long-term evolution  

## Architecture as Practice

These five properties are not theoretical. They are not aspirational. They are practical constraints that shape day-to-day engineering decisions.

Good architecture is not something you “do” once. It is something you **practice continuously**.

The systems that last are not the ones with the cleverest designs. They are the ones that remain:

- Understandable  
- Changeable  
- Operable  
- And honest about their own complexity
