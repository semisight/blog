---
layout: post
title: Blog Plugins
descriptions: Plugins used to render this blog.
categories: [web-experiments]
---

##My Blog Plugins

Below is a list of all of the jekyll plugins that I wrote for this blog. I make no claims to their working state at any time, and they are covered by the [LICENSE](https://github.com/semisight/blog/blob/master/LICENSE) present in the top level of the Github repo that they link to.

###filter_drafts.rb

[filter_drafts](https://github.com/semisight/blog/blob/master/_plugins/filter_drafts.rb) is a simple plugin that takes an array of posts and returns a list of all posts without the YAML metadata 'draft' set. I use it to keep jekyll from rendering my drafts.

Why not use `unless post.draft`? It is an option that is floating around on the jekyll plugins list on the wiki, among other places. I wanted my blog layout to highlight the three most recent posts. Unfortunately, using the `unless` tag in conjunction with a limit:3 `for` loop means that draft posts are also counted in the three most recent. This plugin solves that, by doing the work in Ruby using array#reject.

This causes one problem, however: liquid filters cannot be used inside tags like `for`. They can only be used for direct output. With that problem in mind, we turn to my next plugin, concat_top_3…

###concat_top_3.rb

[concat_top_3](https://github.com/semisight/blog/blob/master/_plugins/concat_top_3.rb) is a dirty hack. It combines what should be multiple filters into a single, hard-coded plugin. Unfortunately, liquid is not very powerful, so this is what I had to do to get what I wanted. With that in mind, concat does quite a bit for me. In essence, it allows be to bypass using a liquid `for` loop by outputting html directly. It is intended to be used like so:

{% highlight text %}{% raw %}
    ##All posts, without any drafts, three most recent emphasized.
    {{ site.posts | filter_drafts | concat_top_3: "ul_class", "li_class" }}
{% endraw %}{% endhighlight %}

Where `site.posts` can be exchanged for any variable that contains an array of posts, and `filter_drafts` can be exchanged for any filter that both takes in and outputs an array of posts.

The output of concat should look like this:

{% highlight text %}{% raw %}
    Post 1 Title
        first paragraph.
    read more >>
    
    Post 2 Title
        first paragraph.
    read more >>
    
    Post 3 Title
        first paragraph.
    read more >>
    
    Post 4 Title
    Post 5 Title
    …
{% endraw %}{% endhighlight %}

Where all titles are links to the post in question.

You are free as always to take and modify any of the plugins above, in compliance with the LICENSE provided.