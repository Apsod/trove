#!/bin/sh

IN=/input

OUT=/output/gutenberg.json

for IN in $INPUT/*.epub*; do
    CMD="pandoc --from epub $IN --to plain | jq -Rsc 'import \"script\"; extract'"
    echo "${CMD}"
done | parallel -j 4 > $OUT

gzip $OUT

