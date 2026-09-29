---
series:
  - "Transformation Under Scale"
part: 5
title: "Transformation Under Scale — Part V: Derive the Roadmap"
date: 2026-09-29
draft: false
description: "A transformation roadmap is not drawn from preference. It is the operating model laid out in time: the dependencies between capabilities are facts about how the business works, the foundation goes first, and what is left is a business decision about which value comes first."
type: application
category: applications
tags: ["Enterprise Architecture", "Transformation", "Roadmap", "Operating Model", "Sequencing"]
---

Part IV drew the boundaries and gave each one a way to move: find the single writer of each fact, then move the pen from the legacy system to the target one without stopping the business. Any one boundary can move that way. A real estate has dozens, and the next question is the one every transformation is judged on: in what order, and by when.

The usual answer is a roadmap drawn on a whiteboard, ordered by a demo date, by the loudest team, or by whatever the vendor can ship first. It looks like a plan and behaves like a negotiation, reopened at every steering meeting. It does not need to be drawn at all. By the time anyone asks for a roadmap, the first four parts of this series have already produced the thing it is made of, and most of the order is already decided.

A transformation roadmap is derived, not drawn. It is the operating model laid out in time: the dependencies between capabilities are facts about how the business works, and what is left once they are honored is a business decision about which value comes first.

<!--more-->

## The roadmap is derived, not drawn

The inputs to a roadmap exist before anyone asks for one. Part I set the constraints the target has to satisfy. Part II named an owner for each capability. Part III laid that operating model over what the systems actually run. Part IV drew each boundary as the set of facts a capability alone writes. Taken together, that is the operating model in full: what the business does, who owns each part of it, and which part alone is allowed to write each fact. What remains is the set of contracts between the parts, every place one capability depends on a fact, an event, or a decision that another capability owns. Each of those is a seam, and each seam gets a type: what crosses it, in which direction, and under what guarantee.

The seams are the roadmap's raw material. A capability cannot go live ahead of the seams it depends on, and a legacy writer cannot be retired while another capability still reads through a seam that writer serves. Every ordering claim on the roadmap traces to one of those dependencies. A claim that traces to none of them is not a constraint, and the roadmap does not carry it as one.

On this program the seam catalog ran to roughly eighty typed contracts between contexts, and it carried a label that did a lot of work: decision-grade, not build-grade. It was precise enough to put order and numbers against, and honest that it was not yet a build specification. That is the right altitude for a roadmap input. A roadmap built on build-grade detail never gets finished, and one built on no detail is a guess.

## What cannot be added later goes first

Some work can join a roadmap at any point. Other work can only go in before anything depends on it, because once consumers exist, putting it in the path means tearing the path open. That work is Phase 0, and it comes before everything else, whether or not it demos well. Phase 0 is not setup work. It is the foundation every later wave creates business value on, and it holds everything that would force a rebuild if it arrived later.

On this program the delivery plan was a Phase 0 followed by eight dependency-ordered waves. Phase 0 held the trust broker ahead of the domains that rely on it, the AI gateway ahead of any agent, and the enforcement interposition in the path from the first day. None of it was a feature a customer would see, and every wave after it depended on it to deliver one. The interposition shipped thin and did little at first. It went in on day one because it is the one part that cannot be placed in the path after traffic is already flowing around it.

Put first whatever the rest would have to be re-worked to add.

## The operating model orders what follows

After Phase 0, the strongest dependencies are the ones the operating model itself enforces, and by this point in the series the operating model has a physical form. Part II decided who owns each capability, and Part IV decided which capability alone writes each fact. The target schemas are those decisions expressed in data stores. Every domain owns its own store, more than two dozen across the estate, and each store holds exactly the facts its domain writes. A target schema is not a data design decision. It is the operating model, written down where it can be enforced.

That is why its required references are the roadmap's hard edges. A NOT NULL column whose value only another domain can create is not an opinion someone recorded. It is how operations already works: a fact the business cannot produce until another fact exists. Walk the target schemas for those references and turn each one into a hard edge on the plan. Each hard edge traces to a column, and behind the column to how the business runs, so it can be checked rather than argued.

A hard edge does not only order two capabilities. It can split the move of a single domain into stages, and that is where Part IV's mechanics earn their place. On this program the target schema's entitlement row carries a NOT NULL reference to a catalog definition. In operating-model terms, a customer holds products, and only the catalog defines what a product is; the schema just wrote that down. Creating a new customer needed nothing from the catalog, because a person record references nothing the catalog owns. So the pen for creating customers moved first, and the new customer domain became the writer for every new customer. Migrating an existing customer was a different act. An existing customer arrives with entitlements, and every entitlement has to point at a product the new catalog defines, so migration could not start until the catalog could create those definitions. Between the two stages, the estate ran the sanctioned two-writer transient from Part IV: the new domain creating customers, the legacy system still holding the customers it already had, every write translated between them, and a death date tied to the catalog landing. That one required reference decided where the straddle began and where it had to end.

Everything below the hard edges is softer: a dependency a team can bridge with a temporary translation, or a preference for landing one journey before another. Label those as soft on the plan. The distinction is what lets a roadmap bend under pressure without breaking, because everyone can see which edges bend and which ones the operating model will refuse.

The strongest dependency claims are the ones the operating model enforces.

## Lanes, not projects

A roadmap needs a unit of work, and the usual unit, the project, is the wrong one. Projects are organized by team or by system. A roadmap of projects can land a capability whose prerequisites sit in another project's backlog, and then the capability waits, delivered and unusable.

The unit of delivery is the capability, closed over its dependencies. A capability is deliberately smaller than a domain. A domain is the group of capabilities that belong to one business fact and its one writer. The customer domain holds creating a customer, maintaining one, and holding the products a customer owns, and each of those is a capability that can land on its own once everything it depends on is in place. Delivering capability by capability is how Part IV's pen moves one fact at a time rather than one domain at a time, and it is why creating customers could land before the customers' entitlements could move.

A capability depends on Phase 0 and on other capabilities that have already landed, and on nothing else. Its closure is stated in capabilities, never in lanes or teams, and that is what makes it portable.

Capabilities are grouped into value lanes, each a set of capabilities that together deliver something the business can use. Lanes carry value, not dependencies. Because every capability's dependencies point at other capabilities, a capability can move from one lane to another without breaking anything, and lanes have no ordering among themselves. Order lives one level up. A wave is a grouping of lanes, and a later wave can depend on what earlier waves landed. That is the whole structure of the roadmap: capabilities closed over their dependencies, grouped into lanes for value, and lanes grouped into waves for time.

On this program eleven value lanes came out of the domain inventory, and every candidate phasing was a different way of placing them into waves. Lanes are also where the two views from Part II meet. The company communicates in journeys and owns in capabilities, and a lane is how a journey gets delivered without redrawing who owns what underneath it.

Dependencies belong to capabilities, and order belongs to waves.

## Quarantine the open decision

No real roadmap starts with every decision made. A vendor has not been chosen, build against buy is unsettled, a regulator's reading is pending. The mistake is letting an open decision gate the whole plan, so the program waits on procurement. The fix is architectural, and it is the payoff of every boundary drawn so far.

A clean domain owns its contract. The shape of what it accepts and returns belongs to the domain, the way Part II's catalog ruling had the company own the shape while a vendor supplied the engine. Once the contract is the domain's and not the product's, everything on the other side of it can be built against the contract without knowing what will implement it. Callers code to the domain. The domain's first implementation can be the legacy system behind the same contract, the straddle from Part IV run in advance, and the chosen engine replaces it later without the callers moving. An open decision stops being a wall across the roadmap and becomes one piece of work behind a stable contract.

On this program the identity build was split into eight work units while the choice between extending the incumbent identity engine and buying a new one was still open. Every contract the units exposed was engine-neutral by construction, so the choice gated exactly one of the eight. The other seven were built and tested against the contract with the incumbent serving behind it, the same straddle the migration used, and the decision could be taken on procurement's timeline instead of the architecture's.

For each open decision, list the work it actually blocks, redraw the contract until that list is as short as it can be, and put the decision's deadline on the roadmap next to the work it gates.

A good plan quarantines its open decisions; a bad one lets them gate everything.

## The business chooses the story

With Phase 0 fixed, the hard edges found, every capability closed over its dependencies, and the open decisions fenced, engineering has done its part. What it hands over is not a roadmap. It is the set of roadmaps that can actually be built, and the way to produce that set is to propose several ways of placing the lanes into waves and score them in two passes.

The first pass is pass or fail, and it belongs to engineering. Every hard edge is honored. Phase 0 sits ahead of everything that consumes it. No capability lands in a wave ahead of the capabilities it depends on. Every two-writer transient the ordering opens carries a death date. No open decision gates more than the work it was fenced to. A phasing that fails any of these is not a roadmap, however good its story.

The second pass scores what survives on the things the business actually trades between: how soon the first real value lands, which customer journeys stay whole from one wave to the next, how many straddles are open at once and for how long, how much risk sits in any single wave, and whether the work fits the capacity the business is paying for, since more work at the same monthly burn is simply a longer program. The rubric is written before any phasing is proposed, so the phasings are measured against it instead of the rubric being bent toward a favorite.

Expect more than one phasing to pass the first pass. On this program five candidate phasings of the eleven lanes were scored, and all five passed every hard gate. That was the finding. The engine underneath each phasing was the same, and the choice between them was which narrative to tell the room. That is a business decision about value, and for the first time it could be made informed. Every option on the table was buildable, and the executives chose on journey continuity, which customer journeys stayed whole from one wave to the next. They were not guessing at feasibility and they were not negotiating with engineering. They were deciding what the business would get first, which is the decision that was always theirs. When several phasings pass, the architecture function says so plainly instead of manufacturing a technical reason to prefer the one it likes.

Most sequencing debates are narrative debates in engineering costume. Scoring them takes off the costume and hands the narrative to the people who own it.

## Every wave says what it does not deliver

A roadmap loses its credibility one overclaimed wave at a time, and it loses it fastest in the early waves. A wave that lands a capability has not necessarily delivered value. The value arrives when something consumes the capability, and the consumers are often waves away.

On this program one early claim said a capability would land in wave one, and an executive called that claim a white lie. The capability did land in wave one. The value did not, because the consumers that would use it sat later in the plan. The executive was right, and the fix became a rule: every wave claim states what the business gets and what it does not get, together, in the same sentence.

A roadmap stays believable by saying what each wave does not deliver.

## Closing

Everything before this essay was an input. The constraints from Part I, the operating model from Part II, the estate from Part III, and the boundaries from Part IV exist so that this artifact can be produced, in a form nobody has to take on faith. A roadmap derived this way is the operating model laid out in time, and it is the transformation's contract with the business. Phase 0 is the foundation the value is built on. Each hard edge traces to how the business already works. Each capability is closed over what it needs, and lanes group those capabilities into value that the waves put in order. Each open decision is fenced to the one piece of work it holds, and each wave says what it will and will not deliver.

That changes what the room argues about. What each capability needs is settled by its dependencies, and the work within it belongs to the teams delivering it. Which lanes go in which wave is the executives' job, and now they do it with every phasing in front of them known to be buildable, so the argument is about which value the business gets first rather than whether the plan can work. Engineering is left defending edges it can show instead of dates it invented.

What remains is keeping it. A roadmap that is right on the day it is approved still has to survive the estate, the schedule, and the senior person who wants the one exception that unravels the rest. Holding the line is the last essay.
