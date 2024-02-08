#!/bin/sh

OUT=/output/litbank.json
IN=/input
TMP=/var/tmp

parallel --results $TMP/{1/} pandoc --from epub --to plain ::: $IN/*.epub
jq -Rsc 'capture("(?<prefix>^.+?Litteraturbanken.se – The Swedish Literature Bank\\s++)(?<text>.*+$\\S)\\s*$"; "m")' $TMP/*.epub > $OUT

gzip $OUT
