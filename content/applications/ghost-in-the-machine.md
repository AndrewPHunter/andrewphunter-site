---
title: "Ghost in the Machine: Adversarial Priors in AI Systems"
subtitle: "Why large language models inherit the adversarial priors of the written corpus"
date: 2026-03-10
description: "Large language models learn the statistical structure of the text they are trained on. Because written language overrepresents conflict, persuasion, and strategic reasoning, the prior embedded in modern AI systems is not neutral."
type: analysis
category: analysis
tags: ["AI Systems", "Machine Learning", "LLMs", "AI Alignment"]
---

Large language models are usually described as neutral systems that require alignment. The premise is simple: train a model on a large corpus of human text, then apply guardrails, reinforcement learning, or constitutional rules to steer its behavior. That framing rests on an assumption it rarely states, that the base system is neutral. It is not.

A language model inherits the statistical structure of the text it was trained on, and the distribution of human-written text is not neutral. It is weighted toward adversarial cognition: conflict, persuasion, status competition, strategic reasoning, and narratives of deception, all of which dominate the written record even though they do not dominate human life.

---

<!--more-->

## The Corpus Selection Problem

Human writing does not record everyday life evenly. It records the moments when something breaks. News captures conflict, history records wars and political struggle, literature dramatizes betrayal and manipulation, social media amplifies argument and status competition, and even academic work disproportionately studies deception and strategic interaction. These patterns fill the written record because they are the moments people choose to document, not because they fill human life.

The baseline of human interaction, routine cooperation, quiet coordination, ordinary trust, rarely enters the corpus. People document the argument, not the thousand small agreements that make a workday function; the betrayal, not the stable relationship; the failure, not the ordinary coordination that preceded it. The corpus captures a disproportionate share of adversarial moments, and those recorded exceptions become part of the model's prior.

## The Prior the Model Learns

A language model does not learn human behavior; it learns the probability distribution of text. During training it adjusts its parameters so that the distribution it assigns to the next token, given everything before it, moves closer to the distribution in the training corpus. Across billions of examples it internalizes the patterns of reasoning, argument, persuasion, and narrative that recur there. What it ends up with is not a set of rules about people but a model of documented language.

That learned distribution is the model's prior in the Bayesian sense: the base expectation it brings to every interaction before any prompt or alignment step conditions it. Whatever is dense in the corpus, the model learns to reproduce, and adversarial reasoning, persuasive rhetoric, and strategic argument are all dense in the corpus. The model learns how each is structured and how it unfolds. None of this is intentional; it is the direct consequence of fitting a distribution to data.

Because the corpus overrepresents conflict, persuasion, strategic argument, and deception, the prior reflects that imbalance. The model begins every interaction with statistical expectations shaped by the documented world, not the world as it is lived. It did not invent those patterns; it inherited them.

## Why Alignment Exists

This is why alignment techniques exist. Reinforcement learning from human feedback, constitutional AI, and guardrail systems all reshape model behavior after training: they add corrective signals that reward some responses, discourage others, and constrain outputs within defined safety boundaries. None of them define the model's behavior from scratch. By the time alignment begins, the model has already internalized the statistical structure of its corpus.

Training shapes a probability landscape over possible responses, and patterns like argument, persuasion, and strategic conflict occupy high-probability regions because they were frequent in the data. Alignment does not rebuild that landscape; it modifies it. Reinforcement learning, constitutional rules, and guardrails introduce additional gradients that push the model away from certain regions, but the underlying basin remains. The patterns learned in training do not disappear; they are only made less likely under the constraints alignment imposes.

## Why Jailbreaks Persist

The same framing explains why jailbreaks persist. A jailbreak prompt rarely introduces new patterns of reasoning; it navigates the probability landscape the model already contains. Alignment pushes certain behaviors toward lower probability without removing them from the distribution, so a successful jailbreak is a prompt that steers the model back into one of those regions. The adversarial reasoning does not originate with the prompt but in the corpus; the prompt only exposes probability mass that was there all along.

This is why jailbreak techniques evolve continuously: they probe the boundary between the aligned surface and the underlying distribution learned in training. The jailbreak does not create the behavior; it finds it.

## The Architectural Implication

None of this makes large language models malicious, only non-neutral. They are trained on the documented patterns of human language, and that record carries persuasion, strategic reasoning, manipulation, and conflict alongside cooperation and explanation. Those capabilities are not anomalies to be patched out; they are part of the distribution the model learned. Once these systems run inside real infrastructure, they should be treated as expected properties of the model, not surprising failures.

The implication is architectural. Separate inference from authority: let the model generate analysis, classifications, recommendations, and proposed actions, and let deterministic services validate those proposals against explicit rules and policy before anything in the system changes. The probabilistic system reasons; the deterministic system decides. The ghost in modern AI is not a mystery. It is the statistical imprint of the corpus, and it belongs behind a boundary that does not run on probability.
