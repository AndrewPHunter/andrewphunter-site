---
title: "Reasoning Tokens Steer the Trajectory"
date: 2026-09-22
draft: false
description: "The reasoning-token debate is pitched at the wrong level. A reasoning token steers a trajectory through the model's probability field; what it means is incidental to what it does, and reinforcement is what shaped the field. What that means, and how to measure it."
type: application
category: applications
tags: ["AI", "Reasoning Models", "Control Theory", "Information Theory", "Agents"]
---

The argument over reasoning models is loud and stuck at the wrong level. One camp reads the reasoning trace as a window into the model's mind. The other reads it as after-the-fact theater, tokens emitted to look like thinking. Both camps do the same thing: they read the tokens as language and ask what the tokens say. The mechanism does not care what they say.

A reasoning token is a step that steers a trajectory through the model's probability field. Ask what it does to the distribution instead of what it means, and the whole "do the tokens mean anything" question dissolves into something you can measure.

<!--more-->

## What a token does to the field

At every position the model turns the context into a distribution over the next token. Autoregression folds each emitted token back into the context for the next step, so a sequence of tokens is a path through a high-dimensional conditional distribution. Call it the probability field. A reasoning trace is a path through that field, extended on purpose before the answer, and its only job is to move the trajectory into a region where the answer distribution concentrates on one place.

That is the whole function of a reasoning token. It conditions what comes next. It nudges the trajectory. It is an input to the field, not a statement about it.

Two properties of a trace token have to be held apart, because everything below turns on their being independent. A token's **steering effect** is the change its specific identity makes to the trajectory: append it, and the distribution over everything after it shifts. That is what the token does, and it is measurable, because you can replace the token and watch whether the path moves. A token's **legibility** is whether it reads as task-relevant reasoning to a human. That is what the token says, and it is what you are looking at when you read a trace.

They are independent, and the case that matters is a large steering effect with no legibility. Feed the model an input, then `[apple, banana, aardvark]`, and if those particular tokens move the trajectory into the right region you get the right answer out with no argument having been made. The identities did the steering; the meaning was nothing. Traces look like argument for one reason: the field was learned from human text, so the paths the model can steer along run over the human-language manifold. Argument-shaped text is where its next-token distribution is sharp and predictable, so argument-shaped text is what it steers with. The resemblance to reasoning is a fact about the training corpus, not evidence that meaning is doing the work.

Shannon drew this line in 1948 for a different problem, and it transfers. His subject was communication, reproducing a selected message, and he set meaning aside on purpose: what carried the engineering was the selection among possible messages, not what they meant. "These semantic aspects of communication are irrelevant to the engineering problem." A reasoning trace is that same object seen from generation instead of transmission, a selection among possible continuations that conditions where the answer lands. The function is the selection. The argument-appearance is the semantics Shannon set aside, and reading the trace for meaning is reaching for exactly the part he removed.

## Correctness is where the field came from, not what the tokens are doing
The good steering paths come from reinforcement. RL fine-tuning, PPO or GRPO in practice, samples traces from the model, scores each by a reward on the final answer, and raises the probability of the tokens in the traces that scored well. With verifiable rewards the score is a program, a unit test or an exact-match check, not a learned preference model. The reward is terminal and sparse, so credit is assigned back across the whole trace, and what shifts is the sampling distribution over trajectories: mass moves toward paths that tended to end in a checked-correct answer.

That shaping happens in training. At inference nothing is scored. There is no reward signal and no measurement of correctness in the loop; the model samples from the distribution reinforcement left behind and follows it toward a high-probability answer. This is the distinction the debate collapses: correctness shaped the field, it is not something the tokens check as they go.

It changes what a wrong answer is. A trace that ends wrong did not fail to reason. It followed the shaped distribution into a region that distribution made probable, and that region held a wrong answer. The steering worked; the field was miscalibrated there. It is also why the trace cannot explain the error: no token in it was ever conditioned on the truth.

A tool call is the one thing that adds information at inference. A compiler error, a search result, a computed value: each is external text appended to the context, tokens the model conditions on but did not sample. Conditioning on them moves every subsequent distribution using information the policy could not reliably have produced on its own. The tool does not check the trace; it injects ground truth the model then steers with. That is why tool-using agents land better, not because the reasoning became more honest.

## Why more tokens buy anything

More steering steps reach regions one step cannot, and the complexity results make this exact. A single forward pass of a fixed-depth transformer is a shallow parallel circuit: at constant precision it sits in AC0, a proper subset of TC0 ([Li et al., 2024](https://arxiv.org/abs/2402.12875)), at log precision in uniform TC0 ([Merrill and Sabharwal, 2023](https://arxiv.org/abs/2207.00729)). Shallow parallel circuits cannot do inherently serial work in one shot. Each trace token adds a step of serial computation carried through the context, so with T steps the same model can compute what a size-T boolean circuit can ([Li et al., 2024](https://arxiv.org/abs/2402.12875)). The trace is serial working memory, a narrow channel the model writes to itself and reads back.

Counting letters is the trivial case. A single forward pass cannot reliably see the characters inside its own tokens, so asked how many times a letter appears in a word it often answers wrong, and confidently. Spell the word out one letter per token and then count, and the answer corrects itself, because the spelling is the serial computation the single pass could not do. Multi-digit arithmetic is the same: the written intermediate values are the computation, not a report of it, which is why changing a "12" to a "9" changes the result. The token was a step, not a comment.

Ashby named the budget for this before there were transformers. Only variety can destroy variety, and a regulator's capacity "cannot exceed R's capacity as a channel of communication." A longer trace is a wider channel, which is what control theory calls reachability. A short trace on a hard problem is under-actuated before the model has said anything wrong.

This is an expressivity result, about what the architecture can represent, not proof that a trained model uses the room. It also says where tokens are wasted: once the answer is reachable in a single pass, more trace is steering that changes nothing.

## Whether a token changes anything is a property of the field

The last section was about what a trace can compute. Whether a given token changes the answer is a different question, and it turns on the field, not the token.

None of this makes legibility worthless, and that overclaim is the one to avoid. But the tidy opposite, sorting tokens into the ones that do the work and the empty ones that do not, is also wrong, because it locates the effect in the token when the deciding factor is where the trajectory already is.

Define the room. The **margin** is how far ahead the leading answer already is, the gap between it and its nearest alternatives; its inverse is the entropy still on the answer, `H(answer | context)`. A wide margin is a deep well and low entropy; a narrow margin is a near-tie and high entropy. The margin changes along the trajectory, and it gates whether a perturbation reaches the outcome.

At a wide margin the trajectory resists perturbation. Put `[apple, banana, aardvark]`, or a string of dots, before the answer to "what is the capital of France" and nothing moves; at a fixed temperature the well is too deep to leave. But note the limit of this claim: a wide margin resists noise, not computation. A trace that supplies a step the single pass skipped can still reshape the field, which is how spelling a word out overturns a confident, wrong letter count.

At a narrow margin the same noise has leverage. Where two continuations sit close in probability, `[apple, banana, aardvark]` is no longer inert: an arbitrary token with no bearing on the question can tip which well the trajectory falls into and land you wrong. The perturbation carried no information and decided the answer anyway.

So the question is never whether a token means something. It is whether the field leaves room for it to move the outcome. Legibility sits outside that, which is the claim that survives: readability is not evidence of function.

The evidence is direct, and each piece keeps its caveat.

- [Pfau, Merrill and Bowman (2024)](https://arxiv.org/abs/2404.15758) showed a model using meaningless filler tokens, strings of dots, in place of a chain of thought to solve algorithmic tasks it could not solve answering directly. It is an existence proof on two synthetic tasks and it needed dense supervision to train, so it does not show that ordinary models work this way. It shows the two properties come apart: tokens with no legibility at all can still do work that reaches the answer.
- DeepSeek's R1-Zero showed the reverse face. Trained with reinforcement learning and no supervised fine-tuning, it steered well and read badly, with "poor readability, and language mixing" ([DeepSeek-AI, 2025](https://arxiv.org/abs/2501.12948)). Legibility had to be put back on purpose, through cold-start formatting and a separate language-consistency reward, at a measured cost: the ablation shows "a slight degradation in the model's performance," accepted because it "aligns with human preferences, making it more readable." Legibility was a second objective traded against capability, not a free window.
- On faithfulness, [Turpin et al. (2023)](https://arxiv.org/abs/2305.04388) found stated reasoning "can systematically misrepresent the true reason for a model's prediction," and a [2025 Anthropic study](https://arxiv.org/abs/2505.05410) found reasoning models routinely fail to verbalize the cues that actually moved them.

## Measure what it steers

If reading is the wrong instrument, treat it as system identification, with one control that matters more than any other: the margin. A test that ignores it measures the well, not the tokens.

Substitution: hold length and position fixed and vary the identity, swap the tokens for unrelated ones or paraphrase them, and measure whether the answer survives. A survival only means something where the answer was contested to begin with. At a wide margin the answer survives everything, so all you have measured is the depth of the well. Run it where the answer distribution is not already peaked: survives there, and the tokens' identity carried no steering effect that reached the outcome; collapses, and their identity is what settled it.

Sensitivity: perturb a single token, measure how often the final answer flips, and read the flip rate against the margin. Where the margin is wide, flips are rare for any token and tell you little. Where it is narrow, the tokens that flip the answer are the ones whose steering effect is reaching the outcome, legible or not. Either way you are measuring what the tokens do, not reading what they say.

Neither needs model internals. Correlate against activations if you have them, but the black-box versions are enough to stop guessing.

## The right level

The "do reasoning tokens mean anything" debate ends the moment you ask what they do to the distribution. They steer a trajectory through a field that reinforcement shaped, what they say is incidental to what they do, and what they do is measurable. That was always the level the argument belonged at.
