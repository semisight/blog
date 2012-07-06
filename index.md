---
layout: default
title: Bitlimn
---

##Posts
<ul class="index">
	{% for post in site.posts %}{% unless post.draft %}
		<li class="exp">
			<h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
			{{ post | only_first_p | read_more: post.url }}
		</li>
	{% endunless %}{% endfor %}
	<br>
	{% for post in site.posts offset:3 %}{% unless post.draft %}
		<li class="exp"><a href="{{ post.url }}">{{ post.title }}</a></li>
	{% endunless %}{% endfor %}
</ul>
