---
title: "Takeaways from QCon London 2017 – Day 1"
type: post
date: 2017-03-19T00:00:00Z
categories: ["Computer Science", "Conferences"] 
tags: ["Conference", "Continuous Delivery", "Data Science", "Microservices", "QCon London 2017", "Quality View", "Security", "Tech Debt"] 
draft: false
featured_image: "img/takeaways-from-qcon-london-2017/qcon-london-2017.jpg"
aliases:
    - "/2017/03/19/takeaways-from-qcon-london-2017-day-1/"
---

As a longtime reader of [InfoQ](https://www.infoq.com/), QCon has always been on my radar. In its 11th year, I managed 
to attend QCon London. For those that haven’t heard of QCon, it’s a top-notch software development conference, held all 
around the world. It’s spread over three days with each day broken into tracks. Each track has a particular focus, such 
as “Architecting for Failure”, “Containers: State of the Art” or my personal favourite “Security: Lessons Learned From 
Being Pwned”.

Overall, I found the conference to be of a superbly high quality. The talks were relevant and well delivered, the venue 
ideal and the food abundant. What follows are my takeaways from day 1.

### The Talks
1. Strategic Code Deletion with Michael Feathers
2. Using Quality Views To Tackle Tech Debt with Colin Breck of Tesla
3. Continuously Delivering Security In The Cloud with Casey West
4. From Microliths To Microsystems with Jonas Bonér
5. Building a Data Science Capability From Scratch with Victor Hu
6. Crushing Tech Debt Through Automation at Coinbase with Rob Witloff

#### Strategic Code Deletion
* If you don’t already have it, a test coverage metric is a great place to start measuring tech debt
* Mutation testing is an even better way of measuring true test coverage, but the tooling is pretty lacking
* If code has very little value, consider removing it
* Mentions of using Martin Fowler’s “Strangler Application” approach

#### Using Quality Views To Tackle Tech Debt
I recommend that you checkout 
[Colin’s blog post](http://blog.colinbreck.com/using-quality-views-to-communicate-software-quality-and-evolution/) for 
the details on Quality Views.
* Mentions of the “Big Ball of Mud” paper
* Mentions of the book “Thinking Fast and Slow” by Daniel Kahneman
* Color Brewer mentioned as a great source of effective gradients

#### Continuously Delivering Security In The Cloud
* A moving target is harder to hit so regularly create and destroy containers — this helps to ensure an attacker does not 
gain persistence
* Secrets can be rotated using a secrets manager like Hashicorp’s Vault

#### From Microliths To Microsystems
A summary of the talk can be found on InfoQ.

* Reactive Design Principles help when developing microservice architectures
* Separate stateless behaviour from stateful entities in a microservice architecture — this helps with scaling
* References to Pat Helland’s paper “Data on the Outside versus Data on the Inside”
* Use Domain Driven Development, but don’t focus on the things (nouns), instead focus on what happens (events)
* CQRS and Event Sourcing mentioned as a useful techniques

#### Building a Data Science Capability From Scratch
Although a good talk consisting of first-hand experiences, there wasn’t a key takeaway for me.

#### Crushing Tech Debt Through Automation at Coinbase
* We need to move fast to survive, technical debt slows us down
* Build in automated guardrails to ensure that we can move fast without bringing down production
* Everyone at Coinbase can deploy a tested master branch to production
* Focus on building a blameless culture
* Create archetype projects to speed up creation of new services
* Do security checks in the build pipeline
* Hashicorp’s Vault mentioned again here
* Coinbase uses Docker — no container lasts for more than 30 days

That wraps it up for [Day 1](/blog/takeaways-from-qcon-london-2017-day-1) can be found here. 
[Day 3](/blog/takeaways-from-qcon-london-2017-day-3) can be found here.