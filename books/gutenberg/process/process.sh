#!/bin/sh

OUT=/output/gutenberg.json
IN=/input
TMP=/var/tmp

parallel --results $TMP/{1/} pandoc --from epub --to plain ::: $IN/*.epub.noimages
jq -Rsc 'capture("(?<prefix>.+?\\*{3} START OF THE PROJECT GUTENBERG EBOOK .*? \\*{3}\\s++)(?<text>.*\\S)(?<suffix>\\s*\\*\\*\\* END OF THE PROJECT GUTENBERG EBOOK.*+$)"; "m")' $TMP/*.epub.noimages > $OUT

gzip $OUT
