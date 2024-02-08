#!/bin/sh

IN=/input
OUT=/output/litbank.json

for IN in $IN/*.epub; do
    CMD="pandoc --from epub $IN --to plain | jq -Rsc 'import \"script\"; extract'"
    echo "${CMD}"
done | parallel -j 4 > $OUT

gzip $OUT
