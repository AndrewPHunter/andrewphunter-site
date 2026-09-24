---
series:
  - "Transformation Under Scale"
part: 4
title: "Transformation Under Scale — Part IV: Write Authority"
date: 2026-09-24
draft: false
description: "A capability's boundary is the set of facts it alone writes. Draw the line by write authority, then move the pen from the legacy system to the target one, one boundary at a time, without stopping the business."
type: application
category: applications
tags: ["Enterprise Architecture", "Transformation", "Data Architecture", "Domain Boundaries", "Migration"]
---

Part III produced the enterprise estate: the operating model from Part II laid over what the systems actually run. The estate names an owner for each capability and shows what is written where. It does not yet draw the lines. An owner can be named for a capability whose data is written in five places, and naming the owner does not say which of the five is allowed to. Drawing that line is the first half of this essay. Moving it is the second.

A boundary is not defined by who reads a fact, or by who acts on it. It is defined by who writes it. Reads fan out and actions fan out, and a healthy system has many of both. Writes do not. The unit of a boundary is a single fact and the single capability permitted to write it.

A capability's boundary is the set of facts it alone writes.

<!--more-->

## The one-writer rule

State authority is the rule that, for every fact the business keeps, exactly one capability writes it. Every other place the fact appears is a copy. This is not a preference for tidiness. It is the property that lets you reason about the system at all. If a fact has one writer, there is one place to change it, one place to audit it, one place that can be wrong. If it has two, there is no fact. There are two values that agree until the day they do not, and nothing in the system says which one is true.

The boundary between two capabilities is the line between what each one writes. Everything else they exchange crosses that line as a copy: reads, events, enforcement decisions. Copies are not the problem. A capability may hold a read replica of another's data, a cached projection, a view denormalized for speed. It may enforce a rule against a local copy of the state that rule depends on. None of that creates a second writer, and none of it dissolves the boundary.

One question separates a safe copy from a broken boundary. Could you delete the copy and rebuild it from the writer? If yes, the copy is a projection. It carries no authority, and the writer stays the single source of truth. If no, if deleting the copy would lose something that exists nowhere else, then it is not a copy. It is a second writer, holding intent that was never recorded at its source, and the boundary has already failed. You have simply not been billed for it yet.

Enforcement copies are fine. Second writers are not. The difference is whether you could burn the copy down and replay it.

## Delegation is a projection

The rule is easy to state and hard to hold when several capabilities need the same fact to do their jobs. The shared need does not license a shared write. One capability writes the fact, and the rest hold projections of it. The sharpest version of this is authority: who may act for whom.

On this program, four layers of the estate touched delegation, and in every design review the instinct was to let each layer keep its own copy of who-can-do-what, because each one had to enforce it. We put the write in a single place. We ruled that who-may-act-for-whom is a set of role facts owned by the customer domain, because that is where the relationship lives, and that domain is the only writer. Access management got a projection of those roles, shaped for enforcement and fast to evaluate at the point of a request; it writes nothing and rebuilds from the role facts on demand. The identity engine, the credential store that proves you are who you claim, got nothing about delegation at all. That last call was the one that mattered, because attaching roles to credentials was the easy argument: the identity system already knows the person, so let it know what the person may do. We refused it. Roles in the credential store make the credential pool a second writer of authority, and they weld the delegation model to a product we intended to replace. Identity engines are swappable; the fact of who may act for whom is not.

One capability writes the fact. The other three read a projection they could lose and rebuild by tomorrow morning, which is exactly why losing it would not matter.

## Household is a query

The one-writer rule also decides what is allowed to be a fact at all. If nothing in the business writes a thing, it is not a fact. It is a view computed from facts, and it belongs in the model as a query, not as a stored entity.

On this program, product asked for household as a first-class entity, a record that customer accounts belong to. The request was reasonable on its face, because the business does reason about households, market to them, bundle for them. We refused it as an entity and granted it as a query. A household has no writer. Nothing creates one as an act, no event mints one, no owner is accountable for the moment it begins, because it never begins. What exists are people and the roles that relate them, and a household is a pattern over those roles: the accounts that share an address, a payer, a plan. Give the pattern its own record and you have made a thing with no writer, so the first time two systems disagree about who is in a household there is nothing to consult, because nothing was ever written. The same test settled a parallel request to store line-references as their own entities. Nothing wrote them that the roles had not already written.

The one-writer test is also an existence test. If no one writes it, do not model it. Compute it.

## The writer today is the legacy system

The boundaries are drawn now, and each fact has one writer. On a fifteen-year estate, though, the writer the target design names almost never exists yet. The fact is written today by a legacy system, in a schema no one would choose, and the capability meant to own it is still a box on a diagram. A boundary says where the pen belongs. Migration is moving the pen there while the business keeps writing with it.

The move every plan reaches for first is the one to refuse: freeze the old system, build the new one, cut over on a weekend. The business does not stop for the weekend, the old system holds intent no one ever wrote down, and the cutover is never as reversible as the plan claims. Write authority has to move one boundary at a time, along the lines just drawn, with the business writing the whole way through.

## Move the pen, not the paper

The mechanism that makes a piecemeal move safe is a façade in front of the fact with the new writer behind it. Callers keep calling what they always called. Behind the façade, a new domain aggregate becomes the single writer, and an anti-corruption layer composes the legacy primitives it needs in new, clean code. The rule on that layer is strict: it may read legacy and it may call legacy, but it never extends legacy and never adds a stored procedure to it. The old system keeps serving reads. The new system takes the writes. The business sees the same interface the entire time.

Moving the pen is not moving the data. The rows can stay in the old tables and be copied forward on a schedule for as long as they need to, because a copy carries no authority. What moves is the single right to write the fact. Once the new aggregate holds that right, the old system's copy is exactly what the one-writer rule already named it: a projection, safe to keep serving and safe to delete.

This is why the delegation call earlier mattered. The credential stores were the clean case for it. We had refused, when the boundaries were drawn, to let roles live with credentials, because identity engines are swappable and authority is not. Moving the pen proved the point. Three credential stores collapsed to one authority with no password reset, by freezing creation on the sources, migrating each account lazily at its next sign-in, and watching the store count fall to one and stay there. Nothing went dark, because nothing was moving except the right to write.

## The sanctioned two-writer transient

Moving the pen one boundary at a time means that, for a while, two systems can write the same fact. That is allowed, and it is where most migrations quietly fail. A two-writer period is not a sin. An ungoverned or undated one is.

Coexistence held on this program only under three conditions, all three at once. The new domain was the system that minted the fact. Every legacy write was translated into a command against the new writer, and every new write into a command the legacy system understood, because translation has to carry intent and a change-data-capture feed does not: a diff tells you a value changed, never why, and the why is the thing the new model needs. And the echo each translation produced was suppressed in both directions, so a single write did not ping-pong between the two systems as a stream of false updates.

Every straddle shipped with a retirement trigger and a date. An inline legacy key with no death date does not stay a convenience. By year two it is something no one can remove, because six other things have started to read it. The date is the whole difference between a transient and a new permanent layer.

## The straddle

The same discipline runs on the caller side, and it can start before the new writer exists at all. When the vendor selection for one domain slipped a quarter, the channel teams did not wait. They built their view models in the target shape and pointed them at the legacy client through a single server-side translation, on the order of fifteen mapper functions per repository. When the new façade landed, the only thing that changed was the mappers' input. The components above them did not move, and that they did not move was the acceptance test. The slip was not lost time. It was the window in which the callers learned to speak the target language, so that the cutover, when it came, changed one layer and no other.

## Closing

Write authority is the whole of a boundary. Drawing the line is deciding who should hold the pen. Migration is moving the pen there without the business breaking stride. The fact never has two owners, even across the months it has two writers, because one writer is minting and the rest are translating against it on a clock that ends.

The boundary arguments that held came down to one question: who writes this. I have stopped trusting the ones settled by the org chart, or by where a capability happened to live that year, or by which team argued hardest, because those reopen in the next review and the write-authority question does not.

Any one boundary can be moved this way. A real estate has dozens, and they do not move in any order. What has to move before what, and why the order is a fact about the schema rather than a matter of opinion, is the subject of the next essay.
