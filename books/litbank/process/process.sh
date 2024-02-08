#!/bin/sh

IN=/input
OUT=/output/litbank.json

for IN in $IN/*.epub; do
    JQ_SCRIPT='capture("(?<prefix>^.+?Litteraturbanken.se – The Swedish Literature Bank)(?<text>.*+$)"; "m")'
    CMD="pandoc --from epub $IN --to plain | jq -Rsc ${JQ_SCRIPT}"
    echo "${CMD}"
done | parallel -j 4 > $OUT

gzip $OUT
