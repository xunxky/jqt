---
name: Home
title: Welcome to jqt
description: Could be jq the basis for a web template engine?
keywords:  jqt, jq, template engine
updated: "2016-08-28T10:27:09Z"
Layout: page
Dependencies: [content/EXAMPLE.txt]
---
<%include content/macros.m>&
<%include content/LINKS.txt>&

# Welcome to <%cite jqt>

<!--
> _Editing is a rewording activity._\
> — _Alan J. Perlis_
-->
<blockquote class="page-quote"><p><em>Editing is a rewording activity.</em><br/>— <em>Alan J. Perlis</em></p></blockquote>

Could be [_jq_][JQ] the basis for a web template engine?
Let’s explore&hellip;

## _jq_

[_jq_][JQ] have nice features like string interpolation and implicit backtracking.
Mixed with the help of some syntactic sugar a powerful template engine appear.
Imagine the following interpolation strings, in a [_jq_][JQ] program,
separated with the comma operator:

### Simple expansion

```html
..., "<title>\(.title)</title>", ...
```

### Conditional expansion

```html
..., "<meta name='date' content='\(.published//empty)' />", ...
```

### Repeated expansion

```html
..., "<meta name='author' content='\(.author[])' />", ...
```

In these examples the strings expand, vanish, or multiply without any
explicit `if` or `for`!

## <%cite jqt>

To write [_jq_][JQ] scripts using strings with interpolations is not the idea we have
for a template language. We need some syntactic sugar, and this is provided by
<%cite jqt>: you write templates in a very fashionable style, the templates
are translated into a [_jq_][JQ] script and then `jq` is feed with the created
script and some content and data in [JSON][JSON] format&hellip; and the magic is done!

### Syntactic sugar

And, how do the _syntactic sugar_ looks like?  Do you think the following
example seems to be a template?

<%include content/EXAMPLE.txt>&

### Status

This site is built using <%cite jqt>, and is itself in his implementation a kind of
tutorial about <%cite jqt>.
If you want to learn how to use <%cite jqt> see all the different sections of this site:

* [Template engine](./engine.html)
* [Page structure](./structure.html)
* [Authoring content](./content.html)
* [Data model](./data.html)

And don’t forget to study this documentation source code in the repository
[`docs`](https://github.com/fadado/jqt/tree/master/docs) directory!

<%cite jqt> is developed under the _Fedora_ Linux
distribution, and a lot of portability issues are expected at this stage of
development. Please, use the project [GitHub repository][REPO] features if you
want to collaborate or send any kind of questions.

<#
vim:ts=4:sw=4:ai:et:fileencoding=utf8:syntax=markdown
#>
