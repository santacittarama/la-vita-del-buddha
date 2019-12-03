#!/bin/bash

# Call this from project root "./helpers/asciidoc_to_tex.sh"

ADOC_SRC="$1"

# no trailing slash
OUT_DIR="./manuscript/tex"

# https://stackoverflow.com/a/2352397/195141
file_ext=$(echo "$ADOC_SRC" |awk -F . '{if (NF>1) {print $NF}}')

if [ "$ADOC_SRC" == "" -o ! -f "$ADOC_SRC" -o "$file_ext" != "adoc" ]; then
   echo "First argument must be a .adoc file."
   exit 2
fi

if [ ! -d "$OUT_DIR" ]; then
    echo "Folder doesn't exist: $OUT_DIR"
    exit 2
fi

echo -n "--- "$(basename $ADOC_SRC)" to TeX ... "

name=$(basename -s .adoc $ADOC_SRC)
OUT_FILE="$OUT_DIR/$name.tex"

# Convert with asciidoctor-latex.

asciidoctor-latex --no-header-footer -o "$OUT_FILE" "$ADOC_SRC"

if [ "$?" == "0" ]; then
    echo "OK"
else
    echo "ERROR, Exiting."
    exit 2
fi

