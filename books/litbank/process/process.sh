#!/bin/sh

IN=/litbank
OUT=/output/litbank.json

for IN in $IN/*.epub; do
    JQ_SCRIPT='capture("(?<prefix>^.+?Litteraturbanken.se – The Swedish Literature Bank)(?<text>.*+$)"; "m")'
    CMD="pandoc --from epub $IN --to plain | jq -Rsc ${JQ_SCRIPT}"
    echo "${CMD}"
done | parallel -j 4 > $OUT

gzip $OUT

OUT=/output/gutenberg.json

for IN in /gutenberg/*.epub*; do
    JQ_SCRIPT='capture("(?<prefix>.+?\\*{3} START OF THE PROJECT GUTENBERG EBOOK .*? \\*{3})(?<text>.*)(?<suffix>\\*\\*\\* END OF THE PROJECT GUTENBERG EBOOK.*+$)"; "m")'
    CMD="pandoc --from epub $IN --to plain | jq -Rsc ${JQ_SCRIPT}"
    echo "${CMD}"
done | parallel -j 4 > $OUT

gzip $OUT

