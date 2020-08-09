#!/usr/bin/env bash

[[ "$1" == *.tex ]] || exit

file=$(readlink -f "$1")
dir=$(dirname "$file")
base="${file%.*}"

find "$dir"  -maxdepth 1 -type f -regextype gnu-awk -regex "^$base\.(4tc|xref|tmp|pyc|pyo|fls|vrb|fdb_latexmk|bak|swp|aux|log|synctex\(busy\)|lof|nav|out|snm|toc|bcf|run\.xml|synctex\.gz|blg|bbl)" -delete
