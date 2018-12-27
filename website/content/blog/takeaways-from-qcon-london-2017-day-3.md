---
title: "Takeaways from QCon London 2017 – Day 3"
type: post
date: 2017-04-09T00:00:00Z
categories: ["Computer Science", "Conferences"] 
tags: ["Conference", "Event Delivery", "Event Sourcing", "Flamegraphs", "Golang", "Microservices", "Python", "QCon London 2017", "Security", "Spotify"] 
draft: false
featured_image: "img/takeaways-from-qcon-london-2017/qcon-london-2017.jpg"
aliases:
    - "/2017/03/23/takeaways-from-qcon-london-2017-day-2/"
---

Here’s day 3. [Day 1](/blog/takeaways-from-qcon-london-2017-day-1) can be found here and [Day 2](/blog/takeaways-from-qcon-london-2017-day-2) can be found here.

### The Talks
1. Avoiding Alerts Overload From Microservices with Sarah Wells
2. How to Backdoor Invulnerable Code with Josh Schwartz
3. Spotify’s Reliable Event Delivery System with Igor Maravic
4. Event Sourcing on the JVM with Greg Young
5. Using FlameGraphs To Illuminate The JVM with Nitsan Wakart
6. This Will Cut You: Go’s Sharper Edges with Thomas Shadwell


#### Avoiding Alerts Overload From Microservices
* Actively slim down your alerts to only those for which action is needed
* “Domino alerts” are a problem in a microservices environment — one service goes down and all dependent services fire alerts
* Uses [Splunk](https://www.splunk.com/) for log aggregation
* [Dashing](http://dashing.io/) mentioned for custom dashboards
* [Graphite](https://graphiteapp.org/) and [Grafana](https://grafana.com/) mentioned for metrics
* Use transaction IDs (uses UUIDs) in the headers of requests to tie them all together
* Each service to report own health with a standard “health check endpoint”
* All errors in a service are logged and then graphed
* Rank the importance of your services – Should you be woken up when service X goes down?
* Have “Ops Cops” — Developers charged with checking alerts during the day
* Deliberately break things to ensure alerts are triggered
* Only services containing business logic should alert

#### How to Backdoor Invulnerable Code
* A highly enjoyable talk of infosec war stories. 

#### Spotify’s Reliable Event Delivery System
* The Spotify clients generates an event for each user interaction
* The system is built on guaranteed message delivery
* Runs on [Google Cloud Platform](https://cloud.google.com/)
* [Hadoop](http://hadoop.apache.org/) and [Hive](https://hive.apache.org/) used on the backend
* Events are dropped into hourly “buckets”
* Write it, run it culture
* System monitoring for:
* Data monitors – message timeliness SLAs
* Auditing – 100% delivery
* Microservices based system
* Uses [Elasticsearch + Kibana](https://www.elastic.co/)
* Uses CPU based autoscaling with [Docker](https://www.docker.com/)
* All services are stateless — cloud pub/sub
* Machines are built with [Puppet](https://puppet.com/) for legacy reasons
* Apparently, Spotify experienced a lot of problems with Docker — at least once an hour
* Services are written in Python
* Looking to investigate [Rocket](https://coreos.com/blog/rocket.html) in future

#### Event Sourcing on the JVM
* Event sourcing is inherently functional
* A single data model is almost never appropriate, event sourcing can feed many and keep them in sync e.g:
* RDMS
* NoSQL
* GraphDB
* [Kafka](https://kafka.apache.org/) can be used as an event store by configuring it to persist data for a long time, however this isn’t what it is currently intended to do
* [Event Store](https://geteventstore.com/) mentioned
* [Axon Framework](http://www.axonframework.org/) mentioned
* Mature
* [Eventuate](http://eventuate.io/) mentioned
* Great for distributed environments/geolocated data
* [Akka.persistence](http://doc.akka.io/docs/akka/current/scala/persistence.html)
* Great, but needs other Akka libraries
* [Reactive Streams](http://www.reactive-streams.org/) will be a big help when dealing with event sourcing

#### Using FlameGraphs To Illuminate The JVM
* Base performance on requirements
* Flamegraphs come out of Netflix
* Visualisation of profiled software
* First must collect Java stacks
* [JVisual VM](https://visualvm.github.io/) mentioned
* [Linux Perf](https://perf.wiki.kernel.org/index.php/Main_Page) mentioned

#### This Will Cut You: Go’s Sharper Edges
* It is possible, in some cases, to cause Go to crash through reading (JSON, XML etc) without closing tags —  it just tries to read forever (DOS attack)
* Go doesn’t have an upload size limit, put your go servers behind a proxy with an upload size limit to mitigate this e.g [NGINX](https://www.nginx.com/), [Apache HTTP](https://httpd.apache.org/)
* Go doesn’t have [CSRF](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)) protection built-in, this must be added manually
* [DNS rebinding attacks](https://en.wikipedia.org/wiki/DNS_rebinding) may be possible against Go servers

That about wraps it up for my summary QCon London 2017.