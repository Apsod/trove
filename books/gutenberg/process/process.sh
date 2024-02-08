#!/bin/sh

IN=/input

OUT=/output/gutenberg.json

for IN in $INPUT/*.epub*; do
    JQ_SCRIPT='capture("(?<prefix>.+?\\*{3} START OF THE PROJECT GUTENBERG EBOOK .*? \\*{3})(?<text>.*)(?<suffix>\\*\\*\\* END OF THE PROJECT GUTENBERG EBOOK.*+$)"; "m")'
    CMD="pandoc --from epub $IN --to plain | jq -Rsc ${JQ_SCRIPT}"
    echo "${CMD}"
done | parallel -j 4 > $OUT

gzip $OUT

