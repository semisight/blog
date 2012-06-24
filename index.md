---
layout: default
title: Placeholder
---

<ul id="nav">
	<li class="nav"><a href="/about">About Me</a></li>
	<li class="nav"><a href="/experiments">Experiments</a></li>
</ul>

##Posts
<ul>
	{% for post in site.posts %}
		<li class="exp"><a href="{{ post.url }}">{{ post.title }}</a></li>
	{% endfor %}
</ul>