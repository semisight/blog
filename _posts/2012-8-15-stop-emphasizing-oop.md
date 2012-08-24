---
layout: post
title: Stop Emphasizing OOP
description: Beating the dead horse of computer science education.
categories: [blog]
draft: true
---

#Stop Emphasizing OOP!

Ok, explanation in order: what I mean by the title is that schools now-a-days tend to offer an OOP-only curriculum, or at least one dominated by it (my own school *currently* unfortunately included).

We need to teach other paradigms for two reasons, first to know the history of computer science, and secondly, because they will stretch the minds of students and make them more competent in their field.

##Those who do not know history…

…Are doomed to repeat it. The disdain that schools show for the history of their department is odd, especially when considered in the context of an undergrad degree. How many art students study Picasso, or impressionism? At least at USC, it's a [requirement](http://www.usc.edu/dept/publications/cat2012/private/pdf/2012_2013/fine_arts_12.pdf). How many graduating students in CS know about LISP or Fortran? My guess is a lot less; USC doesn't cover it. (I don't mean to pick on USC--it is simply where I have had the most experience).

##Human Instinct

It is in our nature to collect, categorize, and classify. Our need to recognize higher patterns is part of what makes us able to achieve so much--it is the reason for abstract mathematics, for biology; it is the reason we now know penecillin is an anti-biotic, and that our solar system is heliocentric. We owe every advancement to this basic drive, and for that reason alone it is irresponsible for us to not teach all of the different forms of categorization that we have come up with in CS.

That is not to say that all classifications are created equal, but OOP itself is a woefully incomplete model. For instance, take the ubiquitous `null` object anti-pattern that comes up in languages like Java and C++. The null pattern takes a value from the range of the function and cordons it off as the 'error' value. In these languages, the error value is generally a null pointer (in C/C++, often a pointer to `0x0`). The problem with this is two-fold. The first is that it deprives us of a value in the range of the function. What if we later need this value to represent a non-error return state, or if our program logic is faulty and accidentally returns this value? The second is that it implicitly passes an error to the calling function, instead of explicitly doing so. The program continues running until a method is called on the null pointer, and then *crash!* it's dead, leaving the hapless intern (I've *never* been in that position…) to recreate the problem and trace through the stack.

Both of these problems can be solved by taking the error out of the range of the return value--we create a new type that pairs both the original return type and the error indicator, but can only represent one at a time (it might look like this in C/C++):

{% highlight c linenos %}
struct return_type {
  	type result;
  	bool is_error;
};
{% endhighlight %}

Then, we simply test if the error indicator is true before we call something that uses this, and throw an error for a return type if it is `true`.

This pattern is called the <a href='http://en.wikipedia.org/wiki/Monad_(functional_programming)#The_Maybe_monad'>Maybe monad</a>. Where `null` checks invite a mess of braces into code, the Maybe monad comes with `null` checks built-in, and will pass the `null` (known in Haskell as `Nothing`) through. This concept overlaps with error handling, but it is more general.

Haskell's Maybe monad (and haskell in general) encourage a staccato series of functions that flow together, each doing one thing. By contrast, C++ and the null-object pattern resist this, by simultaneously making it hard to make small functions (explicit type declarations, no closures) and by making it easy to check for `null` like so:

{% highlight cpp linenos %}
void* func(void* input) {
	if(!input) return null;

	ifstream in(input);
	if(!in) return null;

	...
}
{% endhighlight %}

