---
layout: default
title: Web Experiments
description: Web scripting experiments and code.
---

This page is the home to any and all client-side web code that I've written. Click here for my github account, which will have a more complete repository of both this code and code that is not web related.

<ul>
{% for post in site.categories.experiments %}{% unless post.draft %}
<li class="exp"><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endunless %}{% endfor %}
</ul>