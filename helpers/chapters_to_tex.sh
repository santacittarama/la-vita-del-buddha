#!/bin/bash

for i in ./manuscript/asciidoc/cap-[0-9][0-9]*.adoc; do
    ./helpers/asciidoc_to_tex.sh "$i"
done

#./helpers/asciidoc_to_tex.sh ./manuscript/asciidoc/foreword.adoc

#./helpers/asciidoc_to_tex.sh ./manuscript/asciidoc/preface.adoc
