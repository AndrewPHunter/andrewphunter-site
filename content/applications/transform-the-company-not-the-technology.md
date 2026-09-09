---
title: "Transformation Under Scale — Part II: Transform the Company, Not the Technology"
date: 2026-09-09
draft: false
description: "A transformation re-draws the company's operating model, who owns which business capability, not its technology. The architecture is the downstream expression of the ownership decisions."
type: application
category: applications
tags: ["Enterprise Architecture", "Transformation", "Operating Models", "Business Architecture"]
---

Part I of this series turned the company's objectives into constraints and held them over the estate. That is where a transformation starts, but it is not the first decision it makes. Before you can constrain the technology, you have to settle something older and more contested: who owns what.

A transformation re-draws the company's operating model: the map of the business capabilities and, for each one, who is accountable for it. That is a business decision, and often a legal one. The technology comes after. The systems express the ownership the business decided; they do not decide it.

This is why the work transforms the company, not the technology. Skip the re-draw and go straight to the stack, and you rebuild the old company in cleaner code. Every ownership question the business left open gets decided by the systems instead, by default and out of sight. Better platform, same company. A migration wearing a transformation's name.

<!--more-->

## What a transformation re-draws

Two layers get conflated constantly, and keeping them apart is most of the discipline.

The operating model is the business view. It names the capabilities the company runs and, for each, the one party accountable for it. These are questions about responsibility, not about systems.

The technical architecture is the expression of that model: the systems and contracts that carry it into running software and enforce the ownership the business decided. It is downstream by construction. A system exists in the architecture because a capability in the operating model was given an owner.

Get the order wrong and no architecture saves you. This is Conway's law with the stakes made plain: a system takes on the shape of the organization that builds it, so an unresolved ownership question, two parts of the business each sure the capability is theirs, does not stay a management problem. It becomes a boundary in the code, and it surfaces as a defect years after anyone remembers the argument that caused it. Get the order right and the law works for you. A clean ownership map produces a clean architecture, because the hard target-state decisions were the ownership decisions, and they were already made.

What makes these decisions their own kind is that they are not settled by technical merit. You do not decide who owns a capability by benchmarking a design. You settle it by accountability: who is answerable for it, and who the company answers to for it. That is a different kind of evidence than the rest of this series runs on, and it is why transforming the company is a business act before it is a technical one.

## Ownership of a fact

The deepest decision we made on the program was not a technical one. We ruled that the company mints customer identity. Not a channel, not a vendor, not a partner. The company.

The carrier met its customers across a dozen channels and sold through partners and dealers, and over fifteen years each of them had quietly grown the ability to create a customer. Retail minted one, the web minted another, a partner's platform minted a third and handed it over later. This was the fragmentation Part I described, seen from the inside: several systems each convinced it was the origin of the customer, and no single place that was.

The ruling was one sentence, and what followed was not a negotiation but enforcement. Channel teams lost the ability to create an identity; now they request one. A vendor product gets a slot for the canonical identifier or it fails intake. The identity architecture that took months to build is, in the end, the mechanical consequence of that one sentence.

That is what naming an owner does. Decide who owns a fact and the architecture stops being a set of choices and becomes enforcement of a decision already made.

## Boundaries between capabilities

The other half of the operating model is where the lines between capabilities fall, and those are drawn by the same kind of evidence.

Early in the program, fraud, credit, and financing looked like one capability. Call it risk. They shared data, they shared teams, and every instinct said to build them as one. The instinct was wrong, and what showed it was not a technical argument. It was the question of who each one answers to.

Fraud answers to fraud-loss governance. Credit answers to a fair-lending statute. Financing answers to consumer-lending regulation. That is three capabilities, not one. Each answers to a different regulator and a different law, with its own definition of what even counts as a mistake. Built as one, a single change to the shared thing would have to satisfy every regime at once, and an audit under any one law would have to reason about the other two. We split them on that argument alone. No system design entered the room.

So the boundaries between capabilities are drawn by who you answer to, not by what the code looks like or where it happens to live today. Two capabilities can share every table and still be two capabilities, because they answer to two different authorities.

The same logic decides where a vendor ends and the company begins. When the carrier consolidated its product catalog onto a vendor engine, the ruling was that the vendor supplies the engine and the company owns the contents and the rules. Vendors are scored against the company's capabilities, never the capabilities reshaped to fit a vendor. Buying the engine was a procurement decision. Deciding what the engine is allowed to own was the architecture decision, and it is the one that matters.

## How to re-draw an operating model

The method is small, and it is the same three moves for every capability in the operating model.

Name the single owner of each core capability and each core fact. One party accountable, decided before any system is designed, and decided at the level of the business rather than the org chart. If the answer comes back as two owners, it is not an answer yet.

Draw the boundaries by who you answer to. When two things look like one capability, ask who each is accountable to. If the answers differ, they are two capabilities, whatever the code suggests. If they are the same, they are one capability, whatever the org chart suggests.

Decide ownership before technology. The architecture exists to enforce the ruling, so the ruling has to exist first. A target-state drawn before ownership is settled is a guess, and it will be re-litigated in production.

The check is one question, and it is unforgiving. Take your most contested capability and name its single owner. If you cannot answer in one sentence, with no conditions, you have not transformed the company. You have re-platformed it, and the confusion you meant to remove is now compiling.

## Closing

You transform a company by changing who owns what. The technology is how that change shows up in systems, and no earlier. On this program, every target-state decision that felt technical and intractable turned out to be an ownership decision that no one had made. I have stopped being surprised by that.

Once ownership is drawn, the work changes character. The question is no longer who should own a capability but what is actually running underneath the claim, and that is answered by evidence rather than by accountability. Reading the estate honestly enough to bound it is the subject of the next essay.
