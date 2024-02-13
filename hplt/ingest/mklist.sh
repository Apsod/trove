LANGS=(
    af
    da
    de
    en
    is
    nb
    nl
    nn
    sv
)

for lang in ${LANGS[@]}; do
    wget -O - https://data.hplt-project.org/one/monotext/cleaned/${lang}_map.txt >> sources.txt
done;
