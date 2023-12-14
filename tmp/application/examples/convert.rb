#  frozen_string_literal: true

b = box({ id: :the_html, color: :orange, overflow: :auto, width: :auto, height: :auto, left: 100, right: 100, top: 100, bottom: 100 })
html_desc = <<STR
<!DOCTYPE html>
<html>
    <head>
        <title>Une petite page HTML</title>
        <meta charset="utf-8" />
    </head>
    <body>
        <h1 id='title' style='color: yellowgreen'>Un titre de niveau 1</h1>

        <p>
            Un premier petit paragraphe.
        </p>

        <h2>Un titre de niveau 2</h2>

        <p>
            Un autre paragraphe contenant un lien pour aller
            sur le site <a href="http://koor.fr">KooR.fr</a>.
        </p>
    </body>
</html>
STR

b.hypertext(html_desc)

def markup_analysis(markup) end

def convert(params)
  case
  when params.keys.include?(:atome)

    # Atome.new({type})
    puts params[:atome]
  else
    # ...
  end
end

b.hyperedit(:title) do |tag_desc|
  convert({ atome: tag_desc })
end

# Bien sr ! Voici une liste des principaux types de balises (tags) HTML. Cependant, notez qu'avec l'volution du web et les diffrentes versions de HTML, il peut y avoir de lgres variations. Cette liste est base sur la spcification HTML5 :
#
# 1. **Mtadonnes**:
#    - `<!DOCTYPE>`
#    - `<head>`
#    - `<meta>`
#    - `<base>`
#    - `<link>`
#    - `<style>`
#    - `<title>`
#    - `<script>`
#    - `<noscript>`
#
# 2. **Structure du document**:
#    - `<html>`
#    - `<body>`
#    - `<header>`
#    - `<footer>`
#    - `<nav>`
#    - `<article>`
#    - `<section>`
#    - `<aside>`
#    - `<h1>`, `<h2>`, `<h3>`, `<h4>`, `<h5>`, `<h6>`
#
# 3. **Contenu du texte**:
#    - `<p>`
#    - `<hr>`
#    - `<pre>`
#    - `<blockquote>`
#    - `<ol>`
#    - `<ul>`
#    - `<li>`
#    - `<dl>`
#    - `<dt>`
#    - `<dd>`
#    - `<figure>`
#    - `<figcaption>`
#    - `<div>`
#
# 4. **Contenu en ligne**:
#    - `<a>`
#    - `<em>`
#    - `<strong>`
#    - `<small>`
#    - `<s>`
#    - `<cite>`
#    - `<q>`
#    - `<dfn>`
#    - `<abbr>`
#    - `<data>`
#    - `<time>`
#    - `<code>`
#    - `<var>`
#    - `<samp>`
#    - `<kbd>`
#    - `<sub>`
#    - `<sup>`
#    - `<i>`
#    - `<b>`
#    - `<u>`
#    - `<mark>`
#    - `<ruby>`
#    - `<rt>`
#    - `<rp>`
#    - `<bdi>`
#    - `<bdo>`
#    - `<span>`
#    - `<br>`
#    - `<wbr>`
#
# 5. **Contenu intgr**:
#    - `<img>`
#    - `<iframe>`
#    - `<embed>`
#    - `<object>`
#    - `<param>`
#    - `<video>`
#    - `<audio>`
#    - `<source>`
#    - `<track>`
#    - `<canvas>`
#    - `<map>`
#    - `<area>`
#    - `<svg>`
#    - `<math>`
#
# 6. **Donnes du formulaire**:
#    - `<form>`
#    - `<input>`
#    - `<textarea>`
#    - `<button>`
#    - `<select>`
#    - `<optgroup>`
#    - `<option>`
#    - `<label>`
#    - `<fieldset>`
#    - `<legend>`
#    - `<datalist>`
#    - `<output>`
#    - `<progress>`
#    - `<meter>`
#
# 7. **lments interactifs**:
#    - `<details>`
#    - `<summary>`
#    - `<command>`
#    - `<menu>`
#
# 8. **lments d'criture**:
#    - `<script>`
#    - `<noscript>`
#    - `<template>`
#    - `<canvas>`
#
# 9. **D'autres lments** (comme les lments dprcis ou obsoltes de versions antrieures de HTML) peuvent galement tre trouvs dans le wild web, mais leur utilisation n'est pas recommande dans les nouveaux projets.
#
# Cette liste n'est pas exhaustive et certaines balises pourraient tre ajoutes ou modifies avec de futures versions de HTML. Toujours se rfrer  la documentation officielle ou  des ressources fiables pour une liste complte  jour.