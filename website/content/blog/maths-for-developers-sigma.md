---
title: "Maths for Developers: Sigma"
type: post
date: 2017-01-05T00:00:00Z
categories: ["Maths for Developers"] 
tags: ["Algebra", "Maths", "Python", "Scala", "Sigma"] 
draft: false
alises:
    - "/2017/01/05/maths-for-developers-sigma/"
---

The Sigma notation means "sum up". Essentially, we just add together everything after the Sigma symbol.

`\(a \ne 0\)`

Let's take this:

`\(\sum\limits_{n=1}^5n\)`

You have n after the Sigma, but how to you "sum up" n? Well, if we take a look under the Sigma symbol we see n=1 and if we look above the Sigma we see 5. This means n becomes the range between 1 and 5, inclusive.
So what's the answer?

`1+2+3+4+5 = 15`

So what does that look like as code?

Python
```python
def sigma(n, limit):
    result = 0
    for x in range(n, limit+1): # +1 as range in not inclusive
        result += x
    return result

print(sigma(1,5)) # Gives 15
```
Scala
```scala
def sigma(n:Int, limit: Int): Int = {
    n.to(limit).foldLeft(0)((x,y) => x + y) // foldLeft could be replaced with .sum
}

println(sigma(1,5)) // Gives 15
```
But, that's not the full story. Consider this:

`\(\sum\limits_{n=1}^5n^2\)`

The difference? We're performing some additional work on n, we're squaring it. Let's update our functions to reflect being able to perform additional work on n:

Python
```python
def sigma(n, limit, fx):
    result = 0
    for x in range(n, limit+1): # +1 as range in not inclusive
        result += fx(x)
    return result

def squareIt(x):
    return x**2

print(sigma(1, 5, squareIt)) # Gives 55
```
Scala
```scala
def sigma(n:Int, limit: Int, fx: Int => Int): Int = {
    n.to(limit).foldLeft(0)((x,y) => x + fx(y))
}

def squareIt(x: Int): Int = x * x

println(sigma(1,5, squareIt)) // Gives 55
```