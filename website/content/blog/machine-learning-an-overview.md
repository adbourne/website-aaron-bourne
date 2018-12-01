---
title: "Machine Learning - An Overview"
type: post
keywords: 
date: 2016-12-28T00:00:00Z
draft: false
---
The term “Machine Learning” is prevalent in late 2016. It’s become one of those terms that’s bandied around in tech meetings and the focus of many-a-devs pet project. But what actually is it? A quick google gives [Arthur Samuel’s](https://en.wikipedia.org/wiki/Arthur_Samuel) 1959 definition:

    “[Machine Learning] gives computers the ability to learn without being explicitly 
    programmed”.

Now, I’m someone who spends most of their daylight hours writing code and “explicitly programming”. I find the idea of having the machine do the thing without being explicitly told exactly how to do it, perfectly fascinating. This led me to do research into Machine Learning and its uses.

## The Types of Machine Learning
Broadly speaking, Machine Learning can be split into three different types:

* Predictive / Supervised Learning
* Unsupervised Learning
* Reinforcement Learning

### Supervised Learning
Supervised learning is all about learning how to get from a set of inputs to a set of outputs, providing that we already have some known set of inputs and their outputs.

### Unsupervised Learning
Unsupervised learning concerns recognising patterns in data without really knowing what type of patterns to look for or even what a “good” pattern is.

### Reinforcement Learning
Reinforcement learning is modelling some behaviour in response to reward or punishment stimulus.

## The Problems
The problems Machine Learning aims to solve are varied, what follows are the more significant ones :

* Classification (Supervised)
* Regression (Supervised)
* Clustering & Retrieval (Unsupervised)
* Dimensionality Reduction & Matrix Factorisation (Unsupervised)
* Deep Learning (Supervised)

### Classification
You start Classification with some buckets and a dataset; following classification you end up with predictions of which data goes in which bucket. The goto example for classification is the email spam filter. I have two buckets here, one’s “spam” and the other is “not spam”. The goal is to get each email (the data) into the right bucket. That way the users only has to care about the stuff in the “not spam” bucket. Obviously, it’s not always that simple. Classification also covers cases when there are more than two buckets. Maybe “safe email”, “spam” and “phishing” buckets? It also covers cases where the data can belong in more than one bucket; can an email be both “spam” and “phishing”?

### Regression
Regression is very similar to classification. The difference is that classification gives you a definitive solution (it's spam or it's not spam), whereas regression gives you a continuous solution (think a line on a graph). An example of regression in action is predicting how much I should sell my car for, based on data of similar cars being sold.

### Clustering & Retrieval
Clustering is looking at a dataset in an attempt to identify subgroups in data. A real world example of clustering would be taking a dataset of people who have visited your website (which may include features such as age, salary, gender etc) and then attempting to identify "clusters" of people with similar features for a targeted marketing campaign. To demonstrate this visually, imagine we plot the user data in 3D space. What you have resembles a cloud, with pockets of denser and sparser areas depending on what features are shared. The denser areas in the cloud are your "clusters". The retrieval aspect comes in when you pick a candidate who matches your target audience and then want to select a number of "similar" people to send those marketing emails to.

### Dimensionality Reduction & Matrix Factorisation
This one's a little more abstract. Let's again picture that cloud of 3D plotted user data with all those features. Dimensionality Reduction would be taking that 3D data and reducing it to two dimensions, whilst remaining to capture the "essence" of what the data demonstrates. The reductions of complexity through removal of the superfluous features allows for faster processing and better data visualisations. Dimensionality Reduction is great technique in its own right, but it also assists in Matrix Factorisation. Matrix Factorisation is the driving force behind all of those recommender systems, such as Netflix's movie recommendations or Amazon's "stuff you should buy" recommendations. It works by taking a typically large, sparse dataset (best pictured as a table) and then based on observed behaviours of one user, attempts to "fill in the blanks" in the behaviour of a similar user.

### Deep Learning
How do you recognise a face? How do you tell one face from another? Further still, how do we teach a machine to do the same? You might argue that recognising the configuration of features of a face, such as a nose, eyes and a mouth is enough to achieve this goal. But,  how then do we teach a machine what these features look like in an image? A fascinating aspect of Deep Learning is that this approach actually allows for features to be learned, rather than specified up front. How does Deep Learning achieve this? Well, it's loosely based on how the human brain works — in layers. Each layer performs a relatively simple task, such as as recognising a contour in an image. The layers are then combined in order to solve a more complex task, such as recognising a face.

### Conclusion
Machine Learning is an incredibly broad and complex field with implications far outside the realms of Computer Science. If you're up for more, I would recommend you take a look at [kaggle](https://www.kaggle.com/), the [Coursera Machine Learning Specialisation](https://www.coursera.org/specializations/machine-learning), ["Machine Learning A Probabilistic Perspective" by Kevin P. Murphy](https://www.amazon.co.uk/Machine-Learning-Probabilistic-Perspective-Computation/dp/0262018020) and ["Deep Learning (Adaptive Computation and Machine Learning Series) by Goodfellow, Bengio and Courville](https://www.amazon.co.uk/Deep-Learning-Adaptive-Computation-Machine/dp/0262035618).".

