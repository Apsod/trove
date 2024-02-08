#!/bin/sh

OUT=/output/litbank.json

ls /input/*.epub > tmp-file

cat tmp-file

parallel -a tmp-file pandoc --from epub --to plain | jq -Rsc 'capture("(?<prefix>^.+?Litteraturbanken.se – The Swedish Literature Bank\\s++)(?<text>.*+$\\S)\\s*$"; "m")' > $OUT

rm tmp-file

gzip $OUT
