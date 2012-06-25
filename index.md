---
layout: default
title: Placeholder
---

##Posts
<ul class="index">
	{% for post in site.posts %}
		<li class="exp"><a href="{{ post.url }}">{{ post.title }}</a></li>
	{% endfor %}
</ul>
