---
title: "Takeaways from QCon London 2017 – Day 2"
type: post
date: 2017-03-23T00:00:00Z
categories: ["Computer Science", "Conferences"] 
tags: ["Amazon", "Architecture", "Conference", "Containers", "Data Science", "Deep Learning", "Docker", "ECS", "Erlang", "Instagram", "Kubernetes", "QCon London 2017"] 
draft: false
featured_image: "img/takeaways-from-qcon-london-2017/qcon-london-2017.jpg"
aliases:
    - "/2017/03/23/takeaways-from-qcon-london-2017-day-2/"
---

Now for day 2. If you haven't caught up with Day 1 [check it out here](/blog/takeaways-from-qcon-london-2017-day-2), 
[day 3](/blog/takeaways-from-qcon-london-2017-day-3) can be found here.

### The Talks
1. Deliver Docker Container Continuously in AWS with Philipp Garbe
2. Continuous Delivery the Hard Way with Kubernetes with Luke Marsden
3. Low Latency Trading Architecture at LMAX Exchange with Sam Adams
4. Why We Chose Erlang Over VS. Java, Scala, Go, C with Colin Hemmings
5. Scaling Instagram Architecture with Lisa Guo
6. Deep Learning @ Google Scale: Smart Reply In Inbox with Anjuli Kannan


#### Deliver Docker Container Continuously in AWS
* A big pro for Amazon EC2 Container Service (ECS) over other container orchestrators is that you don't have to worry 
about the cluster state as this is managed for you
* AWS CloudFormation is the suggested way to manage an ECS cluster, although there was also a mention of [Hashicorp's 
Terraform](https://www.terraform.io/)
* Suggested to use Amazon's Docker registry when using ECS
* AWS CloudFormat or the CLI suggested for deployment
* There are 2 load balancers to choose from, the Application Load Balancer (ALB) and the Classic Load Balancer (ELB)
** The ALB only uses HTTP, but has more features
** The ELB does HTTPS, but only allows for static port mapping -- this only allows for one service per port per VM
** ALB required for scaling on the same VM
* Suggested to use load balancing rules based on memory and CPU usage
* ECS does not yet support newer Docker features, such as health check
* The Elastic Block Store (EBS) volume is per VM and doesn't scale that well
* The Elastic File System (EFS) scales automatically and is suggested
* You can have granular access controls in ECS by using AWS Identity and Access Management (IAM)
* Challenges currently exist when using the EC2 metadata service in a container
* ECS does not support the Docker Compose file
* ECS does not natively support Docker volumes


#### Continuous Delivery the Hard Way with Kubernetes (@Weaveworks)
* [Weaveworks](https://www.weave.works/) use their git master branch to represent production
* Weave use [Gitlab](https://about.gitlab.com/) for their delivery pipeline
* [Katacoda](https://katacoda.com/) was used to give a Kubernetes live demo and it all worked rather well
* Plug for [Weaveworks Flux](https://github.com/weaveworks/flux) release manager


#### Low Latency Trading Architecture at LMAX Exchange
* Manage to get impressively low latency using "plain Java"
* Makes great use of the [Disruptor Pattern](https://lmax-exchange.github.io/disruptor/) -- lots of Ring Buffers
* Focus on message passing
* Minimise the amount of network hops
* Uses in-house hardware, not the cloud
* Uses async pub-sub using UDP
** Low latency
** Scaleable
** Unreliable
* Mention of [Javassist](http://jboss-javassist.github.io/javassist/)
* Stores a lot of things in memory, not the database
* Describes using an Event Logging approach
* Java primitives over objects for performance/memory management reasons
* Makes use of [Java Type annotations](https://docs.oracle.com/javase/tutorial/java/annotations/type_annotations.html) 
for type safety
* Mention of the [fastutil](http://fastutil.di.unimi.it/) library
* Mention of using the [@Contended annotation](https://blogs.oracle.com/dave/entry/java_contented_annotation_to_help)
* Uses the commercial JVM [Zing](https://www.azul.com/products/zing/) for improved garbage collection and performance
* Mentions manually mapping Java threads to CPU cores using 
[JNI](https://en.wikipedia.org/wiki/Java_Native_Interface)/[JNA](https://en.wikipedia.org/wiki/Java_Native_Access) for increased performance


#### Why We Chose Erlang Over VS. Java, Scala, Go, C
* Develops [Outlyer](https://www.outlyer.com/) monitoring system
* Version 1 was  a MEAN stack monolith with a Python data collection agent
* Version 2 was microservices
* Focus on separating stateless behavior services from stateful services for scaling reasons
* Uses RabbitMQ for async communication between services
* Uses Riak for timeseries data
* Added a Redis cache layer to improve performance
* [Erlang the movie?](https://www.youtube.com/watch?v=xrIjfIjssLE)
* Erlang uses the [Actor Model](https://en.wikipedia.org/wiki/Actor_model), let it crash!
* Erlang has pre-canned ["behaviours"](http://erlang.org/doc/design_principles/des_princ.html#id62300)
* Erlang has an observer GUI -- allows for tracing and interaction with a live application
* Erlang offers live code reload
* Erlang has a supposed weird syntax
* [Elixr](http://elixir-lang.org/) is a newer language that runs on the Erlang VM -- supposedly has a syntax more like Ruby
* Mentions using [DalmatinerDB](https://dalmatiner.io/)
* [Outlyer blog](http://blog.outlyer.com/) for more information


#### Scaling Instagram Architecture
* Instagram runs on AWS
* Python + Django, Cassandra, Postgres, Memcache and RabbitMQ.
** Postgres for users, media and friendship
** Cassandra for user feeds and activities
* Memcache is used to avoid constantly hitting the DB
* Uses [perf_event](http://web.eece.maine.edu/~vweaver/projects/perf_events/perf_event_open.html) on Linux
* Focus on reducing latency
* Sometimes migrates regularly used code from Python to C for improved performance -- [Cython](http://cython.org/) mentioned
* Always-on custom performance analysis in production - a performance hit but for for a lot of insight
* Disabled the Python garbage collector for performance reasons
* Uses Python [asyncio](https://docs.python.org/3/library/asyncio.html) where there was previously sequential service calls
* Uses [Tao linked DB](https://www.facebook.com/notes/facebook-engineering/tao-the-power-of-the-graph/10151525983993920/)
* 40-60 deploys per day to 20,000+ servers with each deploy taking about 10 minutes!


#### Deep Learning @ Google Scale: Smart Reply In Inbox
* Google Inbox's smart reply learns all responses from data
* Explains deep learning concepts using a feed forward network which uses logistic regression and gradient descent
* Data fed into the network must be a vector of floats
** All words in a dictionary are given an numerical index
** A string of words is converted into a vector of its equivalent numerical representation
** Dimensionality reduction is employed to produce an "embedded vector" -- essentially a lossy compression algorithm
* Deep Learning models allow for automatic feature learning
* See the paper [Distributed Representations of Words and Phrases and their Compositionality](https://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf)
* A Recurrent Neural Network is used by this project and by natural language processing in general
* See the paper A [Neural Conversational Model](https://arxiv.org/pdf/1506.05869.pdf)
* The project can't match tone -- yet.
* A whitelist is used to prevent bad language
* The current approach doesn't always give diverse answers
* Google Translate uses a very similar model
* Mentions [colah.github.io](http://colah.github.io/) for more information

That wraps up day 2, here's [day 3](/blog/takeaways-from-qcon-london-2017-day-3).