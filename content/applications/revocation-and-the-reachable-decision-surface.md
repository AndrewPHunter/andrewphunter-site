---
title: "Governance Under Scale — Part III: Revocation and the Reachable Decision Surface"
date: 2026-04-24
description: "If governance requires the ability to constrain authority, then the critical question is not how a system behaves, but what it remains permitted to do."
type: application
category: applications
tags: ["AI Governance", "Enterprise Risk", "Authority Design", "Control Surfaces"]
---

[Part II](https://andrewphunter.com/applications/monitoring-is-not-control/) separated visibility from control. A system can observe its own drift, make its behavior legible, and surface deviation across time and risk class, and still not be governed, because it cannot change its authority in response. It is instrumented, not controlled.

That leaves one place for governance to live: the capacity to change what the system is permitted to do.

Most current AI governance aims somewhere else. It treats control as a behavior problem: make the model produce safer outputs, fold policy into training, reinforce acceptable responses, condition the system toward the posture the institution wants. Better behavior is worth having, but it is not governance. Training, monitoring, and reinforcement change how a system behaves. None of them change what it is permitted to do next, and at scale that is the distinction that matters.

---

<!--more-->

## The Boundary

Governance operates on a system’s authority, the set of actions it is allowed to take. Behavior is only what it does within that set.

Behavior and authority track each other under normal conditions, which is what makes the confusion easy. A well-trained model stays inside expected bounds, monitoring confirms it, and the system looks stable because it looks familiar. Familiarity is not constraint. A system can behave correctly for a long time and still retain the capacity to act outside its intended limits. Training, evaluation, and observability do not remove that capacity. Only changing the boundary removes it.

So governance cannot be judged by behavior under ordinary conditions. It is judged by what remains reachable when conditions deteriorate. A reachable action is not what the model is likely to produce; it is what the system is permitted to carry forward under defined conditions. Governance operates on permission, not probability. Training lowers the probability of an action; revocation removes the permission.

## Behavior Is Not Authority

Most governance approaches try to embed policy into model behavior. Datasets are curated, outputs reinforced, feedback loops tuned, policy folded into training objectives, drift detected and fed back into model improvement. The system is shaped toward more acceptable responses.

Embedding policy in behavior moves governance closer to where behavior is produced. That is progress over governance as external documentation, but proximity is not authority. A policy embedded in behavior is still mediated through the model’s learned distribution: it lowers the probability of an unwanted output without removing the possibility.

The model does not start from a neutral baseline. As discussed in [Ghost in the Machine: Adversarial Priors in AI Systems](https://andrewphunter.com/applications/ghost-in-the-machine/), large language models inherit the statistical structure of the written corpus, where conflict, persuasion, strategic reasoning, and adversarial patterns are overrepresented. Alignment and reinforcement steer those priors but do not erase the probability space training produced.

The governance consequence is direct. Shaping, feedback, and retraining reduce the frequency of unwanted behavior while leaving the authority surface untouched: the model still holds access to the workflows, tools, decision classes, and execution paths that should be unavailable under certain conditions. It becomes better behaved without becoming bounded.

That is not academic. In a governed system, actions must become unavailable when risk conditions change: a decision class suspended, a workflow forced to escalate, a capability withdrawn, a model’s access to data or tools removed until the boundary is redefined. These are changes in authority, not behavior.

## Revocation

Revocation is the operation that withdraws authority. It is not a corrected output, a retraining cycle, a dashboard alert, or a review meeting; those leave the system’s permissions intact. It reduces what the system is allowed to do. When a risk signal fires, a boundary under strain, or override showing applied posture pulling away from approved, it narrows the set of reachable actions and turns observation into constraint. That is the first mechanism in this series that actually binds. Without it, an institution can see the drift, name the workflow producing the exceptions, and identify the risk class under pressure, and still leave the system authorized to do the same things under the same conditions. Awareness without contraction is not control.

It also has to act forward, which is where most institutional response fails. When something goes wrong, organizations reconstruct: they review prior decisions, trace dependencies, and establish who approved what and under which reading of policy. That work serves audit and regulatory defense, but it arrives after the fact, and while the history is being assembled the system keeps operating in the same permitted action space with the boundary still open. Withdrawing authority cannot wait on the post-mortem. It reduces reachable future actions before the past is fully understood: a workflow forced into escalation, a capability suspended, a risk tier reclassified so that previously permitted actions now require additional authority. Rollback, remediation, and audit all address what already happened; this is the operation that governs what happens next.

## Where Revocation Lives

It cannot live inside the model, or only after it. Treated as a single downstream approval gate, it leaves the system exposed everywhere else that probabilistic behavior can acquire authority. By the time an output reaches final review, authority may already have entered through the request the model was allowed to interpret, the data it retrieved, the tools it called, or the workflow it was routed into.

The enforcement surface has to surround the model, because authority does. The model sits inside a chain of requests, context, capabilities, and execution paths, and it has to exist at each link.

**Before inference,** an incoming request or proposed action is classified against risk posture before the model is allowed to reason over it. Some requests should never enter a model-mediated workflow without escalation, narrowing, or denial.

**During inference,** the model attempts to reach data, tools, memory, or external systems. The governed question is not only what the model says, but what it is allowed to see, retrieve, call, or combine while producing an answer.

**After inference,** output attempts to become action: a recommendation becomes a workflow change, or a proposed decision becomes execution. At that boundary the system decides whether the action is permitted under current risk conditions.

The binding placement varies by institution: request intake in one, the data layer in another, the tool or workflow boundary in others. The surface differs; the function does not. Each enforces the difference between what the model produces and what the system permits.

Those boundaries cannot merely observe. They must narrow access, suspend classes of decision, require escalation, prevent execution, or deny capability under the conditions present at the time of action, without waiting for the model to become better behaved. The form matters less than the function. There must be a layer, or a set of coordinated layers, that can change what the system is authorized to do.

Training shapes tendencies; revocation constrains permissions. A policy embedded in behavior lowers the odds of an unwanted output, but only a policy enforced at the authority boundary stops that output from becoming action. That is the difference between influence and control, and in regulated environments it is not optional. Advice, proposals, and human review do not substitute for it. The system still has to contain enforceable boundaries that decide what is permitted under defined risk conditions. Without those boundaries, governance depends on behavior; with them, it can constrain.

## Closing

Everything the first two parts examined stops short of governance. Correcting an output, observing drift, shaping behavior: none of them change the set of actions a system is permitted to take. Only revocation does.

Build it as a standing capability, not an incident response. It should fire on a risk signal, contract the reachable action set before the past is reconstructed, and reach every surface where the model acquires authority, not only final review. Until a system’s authority can be withdrawn on demand, it is not governed, only well behaved.
