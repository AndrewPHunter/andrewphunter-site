---
title: "Governance Under Scale — Part IV: Model Selection, NAIC, and the Crosswalk"
date: 2026-08-24
draft: false
description: "The NAIC AI bulletin, NIST AI RMF, ISO/IEC 42001, the EU AI Act, and SR 11-7 all require a compliant system, not a compliant model. The crosswalk shows they are one control problem."
type: application
category: applications
tags: ["AI Governance", "Regulatory Compliance", "Model Risk Management", "Enterprise Risk"]
---

Every framework that now governs enterprise AI asks the same question, and none of them ask it of the model. NAIC, NIST, ISO, the EU, and the bank regulators want to know whether the system is under control: what it can touch, what it can do, who is accountable, and how you would stop it. The model sits inside that system as a component whose behavior you can shape but never guarantee.

This is the argument the first three parts made from first principles, now arriving from five directions at once: a governed system built around a model you cannot govern directly.

---

<!--more-->

## The Model Is a Black Box

You cannot make a large language model compliant. It is a statistical system that produces likely continuations, and as [Ghost in the Machine](https://andrewphunter.com/applications/ghost-in-the-machine/) argued, the distribution it learned is not neutral and does not vanish under alignment. You can lower the probability of a bad output. You cannot certify that it will never occur, and no regulator accepts a probability as a control.

So every control that can actually be enforced is a property of the system around the model, not the model itself: what data it may see, what tools and actions it may invoke, and what its output may change before a deterministic check has run. That surface is the authority boundary from Part III, and it is the only place compliance can live. The regulations, read closely, never ask you to open the box. They ask what you built around it.

## Five Regimes, One Requirement

Five regimes now shape how a regulated enterprise may use AI. They use different vocabularies and cover different sectors, but they converge on the same object: the system, not the model.

The **NAIC Model Bulletin on the Use of AI Systems by Insurers** expects an insurer to maintain a written program governing how AI systems are developed, acquired, and used, with accountability, risk controls, testing, and oversight of third-party models and data. It does not name a model. It governs the system that uses one.

The **NIST AI Risk Management Framework** organizes the work into four functions, Govern, Map, Measure, and Manage, with Govern running through the other three. It is voluntary and risk-based, and every function addresses the surrounding practice rather than model internals.

**ISO/IEC 42001** defines an AI management system, the AI counterpart to ISO 27001. It requires policies, roles, risk assessment, lifecycle controls, and continual improvement around the use of AI. It certifies the management system, not the model.

The **EU AI Act** classifies systems by risk and places obligations on high-risk uses: a risk management system, data governance, technical documentation, record-keeping, transparency, human oversight, and accuracy and robustness. The obligations attach to the system in its context of use.

**Model risk management in the SR 11-7 lineage** predates modern AI and still fits. It calls for a model inventory; validation across three elements, conceptual soundness, ongoing monitoring, and outcomes analysis; and effective challenge by objective experts, all wrapped in governance and controls. The federal banking agencies superseded the 2011 guidance in April 2026 (OCC Bulletin 2026-13 and the Federal Reserve's SR 26-2), keeping that discipline and adding a telling move: they put generative and agentic AI expressly out of scope and told banks to govern those systems through their own risk-management practices instead. Even here, the regulator declines to reach inside the model and points at the system around it.

Different words, one requirement. Every one of them regulates the system that surrounds the model, its data, its actions, its oversight, its documentation, and the ability to intervene. Not one regulates what happens inside the weights.

## The Crosswalk

A crosswalk, in compliance work, is a table that maps one framework's requirements onto another's, so a single control can be shown to satisfy both. This section builds one crosswalk for all five regimes at once.

On one axis is a single set of controls, the ones this series has already argued for: classify the risk, constrain what the system may do, enforce that constraint at a deterministic boundary, monitor for drift, revoke authority on a signal, and document all of it. On the other axis are the five regimes. Each cell is what that regime calls that control.

| The control | NAIC Bulletin | NIST AI RMF | ISO/IEC 42001 | EU AI Act | SR 11-7 (MRM) |
|---|---|---|---|---|---|
| Risk classification | risk-based program, proportional | Map | AI risk assessment | risk tiers / high-risk designation | materiality-based rigor, inventory |
| Constrained authority | controls over use | Manage | operational controls | limits on high-risk use | use limits and controls |
| Human oversight & enforcement | human review, accountability | Govern / Manage | roles, operational controls | human oversight | effective challenge, controls |
| Monitoring & drift | ongoing testing and monitoring | Measure | performance monitoring | post-market monitoring, logging | ongoing monitoring, outcomes analysis |
| Intervention / revocation | detect and address errors, retire models | Manage (respond) | corrective action | override, corrective action, withdrawal | overrides, restrict or retire |
| Accountability & governance | governance in the program | Govern | leadership, policy, roles | quality management system | governance, policies and controls |
| Documentation & evidence | documentation | documentation throughout | documented information | technical documentation, logs | validation reports, inventory |

That table is the crosswalk. Read across any row and the five regimes are naming one control in five vocabularies. The leverage is in reading it that way: you do not run five compliance programs, you build one set of controls and produce its evidence five ways. Each audit becomes a relabeling of the same logs, tests, and policies, not a separate body of work. Build the controls, and the citations line up behind them.

## Model Selection Is a Deployment Decision

With those controls defined, model selection stops being a leaderboard question. The governed decision is not which model scores highest. It is where the model runs, what data it is allowed to touch, and whether that data can leave your control. A more capable model that sends regulated data into a vendor's training pipeline is not a better choice under any of the five regimes. It is a data-governance failure with good benchmarks.

The criteria come from the crosswalk, not the evals: where inference happens, whether regulated data stays inside your boundary, whether it is retained or used to train anyone's model, and whether you can log, restrict, and revoke access to it. Model quality matters only after those answers are acceptable.

## The Open-Weight Self-Hosting Trap

There is a tempting alternative: pull open weights onto your own infrastructure, own the model outright, keep everything in-house, remove the vendor from the loop. In a regulated shop it looks like the most conservative, most compliant option available.

Self-hosting does not make the model any less of a black box; it transfers ownership of the opacity to you. And it hands you the entire compliance surface with none of a managed provider's shared-responsibility coverage or third-party attestations. The validation and effective challenge that SR 11-7 wants, the management-system lifecycle that ISO 42001 wants, the monitoring, the patching, the incident response, and the evidence are all now yours to build and to prove, for the model as well as the system. Meanwhile the isolation you were reaching for, regulated data staying in-tenant and out of any training pipeline, is available from a managed platform without taking on model operations at all.

Self-hosting has real uses. Hard data-sovereignty mandates, air-gapped environments, extreme scale economics, and deep customization can each justify it. Choose it for those reasons, with eyes open, understanding that you have bought the whole boundary rather than escaped it. The trap is choosing it as the easy path to compliance, when it is the hardest one.

## On-Tenant Isolation: Bedrock, Vertex, Azure OpenAI

Three managed platforms let you run strong models while keeping regulated data inside your own cloud tenant: AWS Bedrock, Google Vertex AI, and Azure OpenAI Service. On all three, your prompts and outputs are not used to train the underlying models. Keeping them inside your account and region, though, is a configured property and not a default. Each platform has retention paths you have to close: default caches, cross-region processing modes, and abuse-monitoring that stores and human-reviews prompts unless you hold an exemption. Some models go further and require sharing prompts with the model provider as a condition of access, which is itself a selection decision. The isolation is real, but you switch it on: pin the region, disable retention where it defaults on, require private networking and customer-managed keys, and take the abuse-monitoring exemption where the platform offers one.

Mapped to the crosswalk, that configured posture satisfies the data-governance and residency controls the regimes ask for, and it supplies the logging and access control the other controls need. What it does not supply is the authority boundary. Isolation keeps the data in the room. It does not decide what the model is allowed to do with it. You still build the deterministic enforcement, the monitoring, and the revocation yourself. The managed platform is a precondition for those controls, not a substitute for them.


## A Worked Example

Take an insurer that wants an LLM to help claims adjusters summarize files and draft correspondence. The model touches policyholder data and shapes work on real claims, so the NAIC bulletin, state unfair-trade-practice law, and, for EU policyholders, the AI Act are all in scope. Here is one build answering all of them.

**Classify it.** The EU AI Act reserves its high-risk insurance category for risk assessment and pricing in life and health cover, and this use is neither, so it sits outside that line. The insurer governs it as high-risk anyway: it touches policyholder data and shapes claims work, which puts it in the top internal tier under the NAIC program regardless of where the AI Act draws its boundary. The classification is written down and given an owner.

**Choose where it runs.** Deploy on one of the three managed platforms and switch the isolation on: pin the region, disable retention where it defaults on, require private networking, and take the abuse-monitoring exemption. Confirm the chosen model does not require sharing prompts with its provider. Policyholder data stays in the boundary, which settles the data-governance and residency questions before the model does anything.

**Draw the authority boundary.** The model may read a claim file and propose a summary or a draft. It may not set a reserve, approve or deny a claim, or send anything. Its output lands in the adjuster's queue, where a deterministic service checks it for PII handling and required disclosures and a human adjuster accepts or edits it. Nothing the model produces changes state on its own.

**Wire the monitoring.** Every inference is logged with a tokenized claim reference, the adjuster, and a timestamp. Edit and override rates are tracked per correspondence type, and outputs are sampled for accuracy. Drift shows up as a rising edit rate on a given type.

**Make authority revocable.** Set the trigger ahead of time: if the edit rate on a correspondence type crosses its threshold, or a PII check fires, the model's access to that workflow contracts to draft-only or suspends, pending review by the model owner. The contraction is automatic and does not wait for a post-mortem.

**Produce the evidence.** One set of artifacts covers all five: a model-inventory entry and validation report in SR 11-7's terms, the written AI program for the NAIC bulletin, the risk assessment, logs, and human-oversight description for the AI Act, and the documented management-system controls for ISO 42001, with NIST's four functions describing the same work. Only the NAIC bulletin and, for EU policyholders, the AI Act bind this insurer; SR 11-7, NIST, and ISO 42001 are adopted as practice, not law. The one artifact set answers all of them.

It was never five compliance programs. It was one governed system, and each regime reads its own vocabulary back out of it.

## Closing

NAIC, NIST, ISO, the EU, and the bank regulators use five vocabularies for one demand: govern the system, because you cannot govern the model. They know the box is a black box, which is why none of them ask you to certify it. They ask what it can reach, what it can do, who answers for it, and how you would take that authority back.

That makes model selection, isolation posture, and the authority boundary a single decision rather than three, and the system they form is the unit of compliance. Build that system once, to one set of controls, and the crosswalk stops being five burdens. It becomes the essay the regulators already wrote.
