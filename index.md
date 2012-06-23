---
layout: default
title: Placeholder
---

<ul id="nav">
	<li><a href="/about">About Me</a></li>
</ul>

##Posts
<ul>
	{% for post in site.posts %}
		<li><a href="{{ post.url }}">{{ post.title }}</a></li>
	{% endfor %}
</ul>