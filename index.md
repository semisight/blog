---
layout: default
title: Placeholder
---

##Posts
<ul class="index">
	{% for post in site.posts %}
		<li class="exp">{{ post.content | only_first_p | read_more: post.url }}</li>
	{% endfor %}
	{% for post in site.posts offset:3 %}
		<li class="exp"><a href="{{ post.url }}">{{ post.title }}</a></li>
	{% endfor %}
</ul>
