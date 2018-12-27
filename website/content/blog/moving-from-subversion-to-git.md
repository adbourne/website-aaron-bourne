---
title: "Moving from Subversion to Git"
type: post
date: 2017-02-04T00:00:00Z
categories: ["Computer Science"] 
tags: ["Free", "Git", "Source Control", "Subversion", "Training", "Workshop"] 
draft: false
featured_image: "img/moving-from-subversion-to-git/branches.jpg"
aliases:
    - "/2017/02/04/moving-from-subversion-to-git/"
---

Most of the teams I've worked with in the past have moved repositories from Subversion to Git. Almost always because 
they've started off with Subversion, but wanted to follow a workflow which was considered easier for larger teams to 
work together. They wanted to "scale".

Did Git deliver on this? Well, yeah actually. Now, it's worth mentioning that both Subversion and Git are solid version 
control systems. Does Subversion really fall that far short of Git? The later versions of Subversion do solve some of 
the pain points of the earlier versions, but time and time again I've seen choices made to go with Git's distributed 
paradigm over Subversion's centralised paradigm.

![Subversion Topology](/img/moving-from-subversion-to-git/subversiontopology.jpg) 
![Git Topology](/img/moving-from-subversion-to-git/gittopology.jpg) 

 
Subversion above, Git below.

In fact, just last week I worked with a team who had traditionally used Subversion, but had made the choice to start 
their greenfield project using Git. I delivered a short, one-hour workshop with the intention of helping a Developer 
with a background in Subversion make the move to Git.


#### The Workshop
[The workshop can be found here.](https://github.com/adbourne/workshop-svn-to-git)

The workshop started with a ten-minute exercise in which the team represented their current Subversion workflow 
using [cards and arrows](https://github.com/adbourne/workshop-svn-to-git/tree/master/exercises/1_connection) stuck onto 
a whiteboard. If there was a step not covered by the cards, blank cards were provided, but in this case the cards 
covered all the steps the team usually takes. This was a pretty interesting activity to observe and gives a workflow to 
compare to that of the proposed Git workflow later in the presentation.

Following the exercise I talked through the 
[presentation](https://github.com/adbourne/workshop-svn-to-git/tree/master/presentation), breaking for questions and the 
practical exercises. Something to note here is when is comes to the practical exercises, be well acquainted with the 
permissions of your Git repository! Unfortunately, during this delivery not everyone was able to access the repository 
that had been created and were not able to complete the practical exercises on their machine. The demo on the projector 
sufficed, but was nowhere near as engaging as actually "doing the thing". Fortunately, the presentation being freely 
available gives the opportunity to come back later.


#### Questions
Some questions asked after the presentation:

> What's the best Git repository naming convention?

Although there's no real right answer here, I like to use lowercased, hyphen-separated names. As a general rule I also 
like names to start high level and where it makes sense, get more detailed. For example:

```
${PROJECT_NAME}-${REPO_PURPOSE}-${LANGUAGE}

practice-ml-linear-regression-python
workshop-svn-to-git
workshop-intro-to-scala
```

This has the benefit that you can scan through a list of projects pretty quickly and find what you are looking for. 
When you list the contents of the directory containing your cloned projects, all the like projects are grouped together.

> What should I name my branches?

Again, there's no right answer. However, if you're using a bug tracker like Github's issue tracker, Atlassian's Jira, 
etc you will likely have an issue number like "abc-123"; this makes a perfect branch name. Some people like to provide 
more of a context and name the branch for their feature, such as "fix-request-timeout". Some like to do both 
"abc-123-fix-request-timeout".

> How long should feature branches live for?

This one is a tough one, because a feature branch can be periodically updated from and merged into a main branch, but 
still exist without causing much of a problem. A good answer might be "for as long as it makes sense". Merged your 
feature branch and closed your ticket? Delete the feature branch. Merged your feature branch but not yet completely 
done implementing your feature? No harm in keeping it open to work on later.

> How often should I update my feature branch from the main branch?

I would say right before raising a pull request, at a minimum. Again this depends on how often your team commits to the 
main branch. Churning out five closed pull requests an hour? Pull very often, like every 15 minutes. Closing two or 
three pull requests a day? Pull perhaps once an hour, or less frequently. Remember, frequent pulls help to avoid nasty 
merge conflicts!

> The diagram shows a master, dev and feature branch. What's the difference between a master branch and a dev branch?

You mean this diagram?

![Branches Diagram](img/moving-from-subversion-to-git/branches.jpg)

This, again, depends on your workflow. In a team doing 
[Continuous Deployment](https://martinfowler.com/bliki/ContinuousDelivery.html) you might say that everything that gets 
onto the master branch gets into production. So, by having a dev branch we allow the team to integrate and test their 
features before the big push. What if you take cuts from a main branch and release that? You could get away with just 
having a master branch.


#### Conclusion
Overall the workshop was well received and started the ball rolling for a room of Developers to learn Git. Feel free to 
use the material to deliver your own workshop. Found a bug or typo? Please, raise a pull request in Github. 
