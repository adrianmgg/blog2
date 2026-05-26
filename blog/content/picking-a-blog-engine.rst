#####################
Picking a Blog Engine
#####################

:date: 2025-07-17
:modified: 2026-05-26
:status: published


What this document is, anyways
==============================

Eventually, when I've actually settled on a blog engine, this will be a finished document describing why I chose that one over all the other competing options.
\
For now though, this is a living document\ [#]_,
consisting of my notes on the various potential blog engines I've tried.
It will also be a demonstration of whatever blog engine I'm currently using on my site,
and so can also hopefully serve as somewhat of a *hello world* for me trying one out.


.. [#] *living* as in "Continually updated; not static"


.. contents::
   :depth: 1


.. comment block with some stuff in it
   see https://jamstack.org/generators/ for a big list of SSG softwares


What I want
===========

Hard requirements
-----------------
- compiles to static html
- relatively easy to build a blog-style site in
- something scriptable/extensible (or fully bespoke built by me)
  so that I can get everything I want out of it,
  including any requirements I haven't yet thought of

nice-to-haves
-------------
- server for development with auto recompilation/rebuilding,
  and ideally also browser live reloading
- proper LSP/IDE integration if applicable (i.e. I don't need that for markdown,
  but if I'm going to be developing plugins
  and/or writing more complex scripting stuff in template files,
  having LSP for that would be nice.
- written in a language I personally enjoy using
- syntax highlighting for code blocks

  - integration with some existing syntax highlighting standard that many people
    already write configs for, so that I don't have to reinvent the wheel for
    the majority of languages
  - the ability to relatively easily add support for custom languages if need be

- some form of custom build-time scripting within a document itself would be nice


The options
===========

.. contents::
   :local:

TODO: should put a comparison table here

jekyll
------
- pro: extensible
- pro: language=ruby -- I haven't written much ruby, but from what I have written I've enjoyed it
- pro: live reload

typst
-----
- con?: not primarily designed for html/site output, but does support it

  see: https://forum.typst.app/t/my-website-is-now-built-with-typsts-new-experimental-html-exporter/1988

  see: https://typst.app/docs/reference/html/
- pro: live reload
- pro: extensible

  - pro: in-document scripting for simpler stuff https://typst.app/reference/scripting
  - pro: plugin support.

    "typst universe" has a library of existing user-made plugins & templates

- pro: syntax highlighting - appears to support sublime text compatible syntaxes (syntaces? syntices?) & themes

hugo
----
- written in go
- pro: syntax highlighting

  - con: uses 'chroma' library, no way to give hugo a custom lexer


pelican
-------
\... TODO ...

11ty/eleventy
-------------

jekyll alternative written in js

zola
----
- pro: written in rust
- con: no plugin support
- pro: custom syntax highlight themes

rspress
-------

cobalt
------
- pro: rust
- con: seems to be no plugin support

hakyll
------
- pro: haskell
- pro: seems pretty extensible







