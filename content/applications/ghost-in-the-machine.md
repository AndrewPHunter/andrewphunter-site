---
title: "Ghost in the Machine: Adversarial Priors in AI Systems"
subtitle: "Why large language models inherit the adversarial priors of the written corpus"
date: 2026-03-10
description: "Large language models learn the statistical structure of the text they are trained on. Because written language overrepresents conflict, persuasion, and strategic reasoning, the prior embedded in modern AI systems is not neutral."
type: analysis
category: analysis
tags: ["AI Systems", "Machine Learning", "LLMs", "AI Alignment"]
---

**Large language models are often described as neutral systems that require alignment.**

The idea is simple: train a powerful model on large amounts of human text, then apply guardrails, reinforcement learning, or constitutional rules to steer its behavior.

But this framing assumes something important.

It assumes the base system is neutral.

It isn't.

<!--more-->

Large language models inherit the statistical structure of the text they are trained on.

And the distribution of human-written text is not neutral.

It is heavily weighted toward adversarial cognition: conflict, persuasion, status competition, strategic reasoning, and narratives of deception.

Not because these behaviors dominate human life.

But because they dominate the written record.

---

## The Corpus Selection Problem

Human writing does not record everyday life evenly.

It records the moments when something breaks.

News captures conflict.

History records wars and political struggle.

Literature dramatizes betrayal, persuasion, and manipulation.

Social media amplifies argument, status competition, and rhetorical escalation.

Even academic work often studies deception, adversarial behavior, and strategic interaction.

These patterns appear frequently in the written record not because they dominate human life, but because they are the moments people choose to document.

The baseline of human interaction—routine cooperation, quiet coordination, ordinary trust—rarely enters the corpus.

People do not write about the thousand small agreements that make a workday function.

They write about the argument.

They do not document stable relationships.

They document the betrayal.

They do not record ordinary coordination.

They analyze the failure.

The training corpus therefore captures a disproportionate number of adversarial moments.

It records the exceptions.

And those exceptions become part of the model’s prior.

---

## The Prior That Models Learn

Large language models do not learn human behavior directly.

They learn the probability distribution of text.

Training a language model is an exercise in learning the statistical structure of language.

During training, the model adjusts its parameters so that the probability distribution it produces over possible continuations of a text increasingly matches the distribution observed in the training corpus.

Over billions of examples, the model internalizes patterns of reasoning, argument, persuasion, and narrative that appear repeatedly in that corpus.

What the model ultimately learns is not a set of rules about human behavior.

It learns the probability distribution of documented language.

In Bayesian terms, this learned distribution becomes the model’s prior: the baseline expectations it carries into every interaction.

If adversarial reasoning appears frequently in the corpus, the model will learn how adversarial reasoning works.

If persuasive rhetoric appears frequently, the model will learn the structure of persuasion.

If strategic argument appears frequently, the model will learn how strategic argument unfolds.

None of this is intentional.

It is a direct consequence of learning from data.

The model is not learning human behavior as it occurs in the world.

It is learning the patterns of cognition that humans choose to document.

The model learns documented cognition.

Not lived behavior.

---

## The Prior Is Not Neutral

This distinction matters because it changes how we should think about alignment.

If the training corpus overrepresents certain behavioral patterns, the distribution the model learns will reflect that imbalance.

The model begins every interaction with statistical expectations shaped by the corpus it was trained on.

And that corpus is not neutral.

It contains a disproportionate number of examples involving conflict, persuasion, strategic argument, and adversarial reasoning, because those are the moments humans choose to document and analyze.

When a model learns from that record, those patterns become part of the probability mass it carries forward into new interactions.

The system does not begin from neutrality.

It begins from the statistical structure of the documented world.

The model did not invent those patterns.

It inherited them.

---

## Why Alignment Exists

This is why alignment techniques exist.

Methods such as reinforcement learning from human feedback, constitutional AI, and guardrail systems attempt to reshape model behavior after training.

They introduce corrective signals.

Certain responses are rewarded.

Others are discouraged.

Outputs are constrained within defined safety boundaries.

But these systems are not defining the model’s behavior from scratch.

They are steering it.

By the end of training, the model has already internalized the statistical structure of the corpus it learned from.

In effect, training shapes a probability landscape over possible responses. Certain patterns of reasoning—argument, persuasion, strategic conflict—occupy regions of high probability because they appear frequently in the training corpus.

Alignment does not rebuild that landscape.

It modifies it.

Reinforcement learning, constitutional rules, and guardrails introduce additional gradients that push the model away from certain regions of that space.

But the underlying basin remains.

The patterns learned during training do not disappear.

They are simply made less likely under the constraints introduced during alignment.

---

## Why Jailbreaks Persist

This framing also explains why jailbreak techniques persist.

Jailbreak prompts rarely introduce entirely new patterns of reasoning.

Instead, they navigate the probability landscape the model already contains.

Alignment mechanisms push certain behaviors toward lower probability, but they do not remove them from the model. The patterns learned during training remain part of the distribution.

A successful jailbreak is simply a prompt that steers the model into one of those regions.

The adversarial reasoning does not originate with the jailbreak.

It originates in the corpus.

The jailbreak exposes probability mass that already exists within the model.

This is why jailbreak techniques evolve continuously. They are probing the boundary between the aligned surface and the underlying distribution learned during training.

The jailbreak does not create the behavior.
It finds it.

---

## The Architectural Implication

None of this means large language models are malicious systems.

But it does mean they are not neutral reasoning engines.

They are systems trained on the documented patterns of human language, and that record contains persuasion, strategic reasoning, manipulation, and conflict alongside cooperation and explanation.

Those capabilities are not anomalies.

They are part of the distribution the model learned.

When these systems are deployed inside real infrastructure, those behaviors should be treated as expected properties of the model rather than surprising failures.

The practical implication is architectural.

Modern production systems increasingly separate inference from authority.

Models generate analysis, classifications, recommendations, and proposed actions.

Deterministic services validate those proposals against explicit rules and policies before anything in the system changes.

Probabilistic systems assist with reasoning.

Deterministic systems enforce decisions.

The “ghost” in modern AI systems is not mystery.

It is the statistical imprint of the corpus itself.
