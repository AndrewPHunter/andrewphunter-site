---
title: "The Case for Craft"
date: 2026-09-24
draft: false
description: "Moving from writing the code to directing the people who write it does not cost you the craft. The craft was never the keyboard. It is the model you reason with, and it only decays when you stop reasoning through problems with the team."
type: application
category: applications
tags: ["Engineering Leadership", "Systems Thinking", "Craft", "LLM Inference", "Career"]
---


Markus Hartikainen runs a team at AMD that scales LLM inference on vLLM, and last week he asked a question I have been answering, in one form or another, for most of my career:

> After a morning of writing PRs to vLLM, I want to reflect on how many of the PRs I write should sit on the critical path. I still write them. I think I have to reduce how many are mine. Otherwise, I become the blocker. Also, I think more of my time should go to public roadmap issues, RFCs, and public comments on other people's PRs, so the work still moves. I do not know if that is enough to remain technical. I am worried about both credibility and skills/knowledge. How do I keep both of those? If you have gone from writing the kernels and deeply technical work to more directing people who write them, how did you keep contributing to discussions about KV layout, traces, and HBM traffic?

In the comments he put the fear more sharply: "I am not sure I can still see the critical issues in that path if I am less hands-on."

It is a real fear, and it is aimed at the wrong thing. Reaching for the keyboard is natural, and the keyboard was never the craft. I learned that on a ladder that took my hands off the equipment one rung at a time, in a place where losing the craft is a plant problem, not a career problem.

<!--more-->

## The watchstander

I started as a watchstander in the Navy's nuclear power program, responsible for one area of operation in the entire plant. As the watchstander for that area, I was the one who manipulated it. You learn a system that way directly, because it is in front of you.

Then you qualify more watchstations. The territory grows, but the relationship does not change. You are still hands on, and the plant is still something you know by standing in it.

## The engine room supervisor

Engine room supervisor is the first rung where the hands get shared. You are still hands on, but now you are directing watchstanders, and when something needs it you jump in and assist. More of the work happens through other people than through you.

## The watch supervisor

Watch supervisor takes the hands off entirely. You are not directly operating anything. You are directing the engine room supervisors and the other watchstanders, and for the first time you hold the whole plant: every area at once, and how a change in one moves the others.

## The control room

Then engineering officer of the watch, and the plant disappears.

The EOOW sits in the control room. You cannot look around and see the plant or walk over to it while you decide. You direct every operation from a level above it: run this evolution by this operating procedure, answer this casualty with that response, take the reports and decide what they mean. Everything you know about the state of the plant arrives through procedures, indications, and the people standing in it.

This is the rung the fear is about. From the outside it looks like the end of the craft, because the person with the most authority over the plant is the one furthest from it.

## Walking the plant

What kept the craft alive at that rung was not the drills. Drills and casualty scenarios mattered, but they were the exception. The craft lived in the daily work: walking the plant and working with the watchstanders, teaching them, mentoring them, supervising them.

Teaching is the part that did the work. You cannot teach a watchstander why a system behaves the way it does without reasoning it through yourself, out loud, again, in front of someone who will notice if you get it wrong. Every walk-through rebuilt the model, and every question from a new operator tested it. The people on the valves kept my picture of the plant honest.

## The valve

Through all of it the craft was being refined, not lost. There was abstraction at every rung, but no loss of craft.

The proof is what happens when you change plants, which happens even within the Navy. A new plant meant different names on everything. It did not mean a different craft. I understood the steam plant and the condensing system. I knew there was a valve somewhere that had to be throttled to control it, and I knew why. What I did not know was which valve in this plant, so I asked the watchstander.

The specifics are local, and you ask for them. The model travels, and the judgment that comes from it travels with it. That is the value, that is the judgment, that is the craft.

## The same ladder

I did not stay in power, and the same ladder exists in software.

You start by writing code against a small ticket. Then you own a feature. Then a vertical, hands on but directing the people inside it. Then architecture and management, groups of verticals, the whole-system picture. At the top you are not directing a feature at all. You are directing features over time, the way an EOOW directs evolutions across a watch.

The rungs line up because the job at each one lines up. The domain does not. Steam is not HBM, and a condensing system teaches you nothing about attention kernels. What crossed from one industry to the other was not the model of any particular plant. It was how to hold one: build the whole-system picture, know where the controls have to be, and ask the local expert for the specific one.

## What decays

Operating the valves was never the craft, and writing the patch is not either. The craft is reasoning through the system. It decays when you stop reasoning through problems with the people whose hands are on it, not when your own hands leave the keyboard.

## Back to the kernels

KV layout, traces, and HBM traffic are the steam plant of LLM serving. Decode is bound by memory bandwidth, a trace shows the transfers and the waits, and somewhere in the serving stack a knob has to exist to move them. None of that knowledge lives in this month's patches.

The roadmap issues, RFCs, and reviews that fill a senior engineer's week are the control room. They are not a retreat from the technical work but the place where the whole plant becomes visible, and they keep the craft as long as you walk the plant: reason the critical path through out loud with the engineers writing it, teach the new ones why it behaves the way it does, and let their questions test your picture.

That is also the answer to seeing the critical issues. You see them not because your hands are on the patch but because you are still reasoning about the path with the people whose hands are. A trace comes back with decode stalled on transfers, and you know there must be a valve: something in this stack decides how much moves and when, and it can be throttled. You may not know which one it is in this build, so you ask the engineer who does. Knowing it must be there, and why, is the craft.
