#!/bin/bash

asciidoctor -a stylesheet=asciidoctor-custom.css -a stylesdir=./assets/stylesheets -D output main-html.adoc

sed -i 's/<a href="[^"]\+\.html\(#[^"]\+\)">/<a href="\1">/g' output/main-html.html

