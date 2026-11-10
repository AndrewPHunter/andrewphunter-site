---
title: "How AI Became Something We Talk To"
date: 2026-11-09
draft: true
image: "/images/how-ai-became-something-we-talk-to/cover.jpg"
description: "From early rules and learning machines, through the AI winters, to attention and language models: how a broad research ambition became an interface we can use in our own language."
type: application
category: applications
tags: ["AI", "Language Models", "Computing History", "Systems Thinking"]
---

I read a comment on LinkedIn suggesting that the LLM applications we use today would be better described as natural language interfaces. The writer connected them to something we used to dream about in the 1980s: being able to explain what you wanted to a computer and have it work with you.

I think he's right. We wanted to sit down and ask the computer for something without first learning the command, the query language, or whatever name someone had given the feature. We wanted to explain, clarify, and keep going. Now we can do a remarkable amount of that, and calling it a natural language interface somehow sounds like we are underselling it.

Calling all of it AI has made it harder to explain what we have, because the same name covers the field of research, the models we run, and the thinking machines we grew up watching in fiction. Calling it a natural language interface recognizes the achievement rather than shrinking it: we can explain what we want in our own language and work with the computer from there, without borrowing the rest of the fictional machine.

To see where the language model fits, it helps to back up. The field spent decades trying to get computers to do things we associate with intelligence before conversation became the way most people encountered it.

<!--more-->

## What the name was reaching for

The [1955 proposal for the Dartmouth summer research project](https://www-formal.stanford.edu/jmc/history/dartmouth/dartmouth.html) laid out an ambitious premise: learning and other features of intelligence could be described precisely enough for a machine to simulate them. The proposed work included language, abstraction, neural networks, and self-improvement. The 1956 meeting gave that collection of interests a common name, artificial intelligence.

It is worth looking at how much was already inside the ambition. Language was there from the beginning, alongside questions about learning and how to solve problems. The field was never one algorithm waiting to be discovered.

One approach was to give a computer symbols, rules for manipulating them, and a way to search for a solution. Think about a chess position. We can describe the board, specify legal moves, and explore what follows from each choice. Or take a logical proof: begin with statements we accept and apply valid transformations until we reach the statement we want. The computer needs a representation it can work on and a way to choose which possibilities to pursue.

Learning offered another approach. Frank Rosenblatt's [perceptron work in the 1950s](https://web.stanford.edu/class/psych209a/ReadingsByDate/01_30/Rosenblatt58Perceptron.pdf) explored machines that could learn to distinguish patterns. At its simplest, a perceptron weights a set of inputs, adds them, and uses a threshold to make a decision. Training changes the weights when the decision is wrong. The distinction the system learns is held in those weights rather than in a classification rule someone wrote out by hand.

Both approaches gave researchers something they could build and investigate. They also made it tempting to imagine that the rest would follow once the machines were faster and the programs were bigger.

## The winters belong in this story

Search runs into a problem that a successful small demonstration can conceal. Suppose there are ten choices at each step. Looking one step ahead gives us ten possibilities; looking ten steps ahead gives us ten billion paths of that length. A machine that handles the small problem convincingly can become unusable when we enlarge it. We need ways to avoid exploring most of those paths, and knowing which ones to ignore is part of the problem we were trying to solve.

That difficulty, often called combinatorial explosion, was central to the criticism surrounding the [1973 Lighthill report](https://www-formal.stanford.edu/jmc/reviews/lighthill/lighthill.html). Researchers disputed its conclusions, but the gap between controlled demonstrations and broader capability had become hard to dismiss. Disappointment and funding retrenchment in the 1970s became known as the first AI winter.

Commercial interest grew again around expert systems, which concentrated knowledge from a particular domain into rules the machine could apply. Configuring a computer system, for example, requires knowing which components work together and what else each choice requires. Digital Equipment Corporation used [R1, later known as XCON](https://web.cs.wpi.edu/Research/aidg/CS540/papers/McDermott-R1-XCON.pdf), to apply that knowledge to customer orders. A task that had depended on a specialist could now be handled by software carrying the specialist's rules. Businesses had something concrete to buy.

But acquiring and maintaining the rules was expensive. The knowledge had to be extracted from people, expressed in a form the system could use, and kept current as the domain changed. Alongside those difficulties, the market for specialized AI hardware weakened as general-purpose machines became competitive. The late 1980s and early 1990s brought another collapse in enthusiasm and investment, the [second AI winter](https://arxiv.org/abs/2109.01517).

XCON could still configure a computer when enthusiasm for expert systems collapsed. What hadn't followed was the broader intelligence people expected those successes to lead to. Encoding enough knowledge to solve one class of problem had given us a useful system, but extending that knowledge into other areas still required people to do the work. The distance between a working capability and the promise attached to it mattered commercially as well as technically.

Research continued through both winters. One of the questions was how much of that work a system could learn from examples, including the representations it would need to solve the problem.

## Learning had more room to work

Adding layers to a neural network allowed it to build intermediate representations. For an image, those could include edges, shapes, and combinations of shapes learned from the pixels and combined through later layers. We no longer had to design every feature ourselves. The training problem was how to adjust the weights throughout those layers when the final answer was wrong.

Backpropagation gave researchers a practical way to calculate how changes to the weights would affect the error. The influential [1986 work by Rumelhart, Hinton, and Williams](https://www.cs.toronto.edu/~hinton/absps/naturebp.pdf) helped establish learning those internal representations. We could specify the network and the training objective, then use examples to adjust the calculation throughout it.

Over the following decades, that approach gained access to much larger datasets and far more computation. GPUs were especially useful because neural networks contain enormous amounts of arithmetic that can run in parallel. In 2012, [AlexNet](https://cave.cs.toronto.edu/kriz/imagenet_classification_with_deep_convolutional.pdf) demonstrated a large improvement in ImageNet image classification using a deep convolutional network trained on GPUs. It gave a very visible example of what happened when the architecture, training, data, and hardware worked together.

For image classification, the task was already chosen: take an image and identify what it contains. Training supplied representations that made the classification work. Language opened a further possibility: the input could include a description of the task itself.

Give a model a passage and ask it to translate it. Give it the same passage and ask it to explain an unfamiliar term or turn the instructions into a checklist. The material hasn't changed, but what you want done with it has, and you can express that change in another sentence. Language can carry both the work and the directions for doing it. Getting a model to use those directions meant learning relationships across the text, including how a request relates to the material it refers to.

A word's role depends on the words around it, including words that may be a long way away. A system working through a sentence has to preserve enough of those relationships to use them later. Translation made this difficulty concrete: the information needed for the next output word might occur anywhere in the source sentence, whose word order could be quite different. Solving that would bring us closer to a useful language interface, although the name AI encouraged people to hear progress on language as progress toward the whole thinking machine.

## Being able to look back

Some early neural translation systems first compressed the source sentence into a fixed-size numerical summary, then used that summary to produce the translation. Everything needed for the translation had to survive that compression, which became especially difficult with longer sentences.

The [attention work by Bahdanau, Cho, and Bengio](https://arxiv.org/abs/1409.0473), introduced in 2014, let the model draw on information from different parts of the source sentence as it produced the translation. Imagine a verb that appears much later in the source than it will in the translated sentence. Attention let the model use information from that later position when it needed to produce the verb, then draw on other positions for the words that followed. The model learned how to weight and combine that information during training.

In 2017, [*Attention Is All You Need*](https://arxiv.org/abs/1706.03762) introduced the transformer, making attention central to how the network connected information across a passage. Its design also allowed much more of the training calculation to happen in parallel, making better use of GPUs. The original demonstrations were mainly translation tasks, but that combination provided a foundation for training much larger language models.

Language models process text in pieces called tokens, often words or parts of words. For a model trained to predict the next token, the examples are already present in text: the earlier tokens provide context, and the following token supplies the target. Text contains explanations, questions and answers, code, arguments, and descriptions of how to do things. Training across those forms gives a model opportunities to learn how they relate, as well as how words fit together within a sentence.

The [GPT-3 work in 2020](https://arxiv.org/abs/2005.14165) showed how a large language model could perform a range of tasks specified through instructions and examples in its input, without updating its weights for each task. Further work on [training models to follow instructions](https://arxiv.org/abs/2203.02155) made that interaction more useful: demonstrations and human feedback helped shape the model toward responding to what the person asked for.

We now have a way to use the possibility we saw earlier: put the task and the material into the same input. Attention provides a way to relate the parts of that input; training gives the model the learned behavior that makes use of them. The model acts as an interpreter of our request, giving us a natural language interface to the work. We can describe the task, show an example of the result, and revise the request as we go. Calling this a natural language interface names that capability; calling it "an AI" brings the larger expectation of intelligence into the same description.

## What the interface gives us

Consider asking a computer to total completed orders by month, excluding refunds. You know what you want. Expressing it as a query requires another kind of knowledge: which operations to use and how to compose them. A conventional interface might expose those operations through commands or menus, but you still have to translate your request into the form the software accepts.

With a language model, that explanation can be the starting input. It can help express the request as a query, and when you add that you meant the shipment month rather than the order month, you can make the correction in the same language. You can also ask it to explain the query or help work through an ambiguity in the request. Your description gives it something to work from across those tasks. You can bring knowledge of the problem without first acquiring all the syntax needed to express its solution.

This gives attention-based language models a clear place within the history we have just followed. Search gave us ways to explore possible solutions. Expert systems let us apply knowledge expressed as rules. Learning let us derive useful representations from examples. Language models brought a range of tasks within reach of an interface where the request itself could be expressed in ordinary language. AI includes all of that work, and the language model is one of its results.

The conversational interface also resembles how we expected to encounter artificial intelligence in fiction. We would talk to the machine, and it would understand what we wanted. In those stories, the conversation came with a whole intelligence behind it, with its own perspective and continuing understanding of the world. Now we have software that accepts the request and talks back, and we use the same name for it. It is easy to carry the rest of the expectation across with the familiar interaction.

That is where the three meanings of AI become tangled: the research field, the language models we use, and the thinking machines we imagine. A language model is AI in the sense that it belongs to the field. It becomes "an AI" in the product description, and we begin discussing it as the intelligence from fiction. Meanwhile, a failure in that model becomes a claim that AI doesn't work, as though the entire field were represented by the latest answer in a chat window. We lose both the breadth of the research and a useful description of the particular thing it produced.

{{< figure src="/images/how-ai-became-something-we-talk-to/three-meanings-of-ai.svg" link="/images/how-ai-became-something-we-talk-to/three-meanings-of-ai.svg" alt="Three meanings of AI: a research field containing search, expert systems, and machine learning; large language models nested within deep learning, powering a natural language interface; and a fictional thinking machine outside the field map, linked to the interface by a dotted line for shared naming and borrowed expectations." caption="The model belongs to the field and powers the interface. The dotted connection carries the expectations. Select the image to enlarge it." >}}

XCON gives us a concrete reason to keep that distinction in view. It could configure a computer system, and that capability remained useful when the larger expectations around expert systems went unfulfilled. Its success at configuration hadn't established that broader intelligence would follow. A language model's ability to work from an ordinary explanation is a much broader capability, but the step from demonstrating that capability to claiming where it will lead still needs an argument. The name AI cannot supply it.

"Natural language interface" gives us a name for what we can use today: the ability to explain what we want and work with the computer across a range of tasks. The research that made it possible belongs to AI; the way it lets us use a computer fulfills a substantial part of that older interface ambition. We wanted to explain ourselves in our own language and have the machine do something useful with the explanation. That is already a great deal to have built.
