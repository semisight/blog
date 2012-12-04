---
layout: post
title: Digital Identity
description: My thoughts on identity and its digital counterpart (part 2 of 2).
categories: [blog]
draft: true
---

#Digital Identity
##Identity Part 2

Preface: if you haven't read the [original post](/blog/what-makes-you-you/), you may want to do so.

Now that our heads are spinning (well, I assume yours is, I *know* mine is), let's chat about digital identity. When it comes to programming, I'm a huge fan of immutability. I like it when I can guarantee that an object or structure will never change on creation. It relieves me from thinking about things like concurrent modification (the bane of my Java/CS200 existence). I use immutability wherever and whenever I can, because I never know when I'll need its benefits and I don't need the extra performance that mutability gives me.

People, however, are mutable creatures. We change all the time. It would be a deal-breaker for me and many others if Facebook required users to make a new profile for each name/state/school/gender/etc. change that they make.

Unlike with standard identity (i.e. who am I?), the question here becomes "what unique thing will never change about me that I can be identified with?" (a possible database key).

Name is not right. Names can change, for various reasons--people may have aliases for reasons of privacy, humor, or simply because a name is part of a personal brand that one builds but may not always want to live (in the case of celebrities). Google+ doesn't like this idea, and strongly prefers real names.

Names are also not unique. First names tend to be common, and while last names are less so, mathematical improbability does not preclude duplicates (see: [hash function collision](http://en.wikipedia.org/wiki/Collision_(computer_science))).

What about email? A number of services nowadays use email as a unique identifier. It certainly is unique; two people cannot use the same email independently of each other. While it is unique, it is not (or should not be) immutable. I used the same email for 9 years (from age 9 to 18). I wish I could change it, but all of the services that I rely on still use it and depend on me having the same email *forever*.