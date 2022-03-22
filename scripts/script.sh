cat prelude.maude | \
    grep -E '^[\t ]*(fmod|mod|fth|view)' | \
    sed 's/ is/)/' | \
    sed 's/ from.*//' | \
    sed 's/{.*//' | \
    sed "s/view /v('/" | \
    sed -E "s/(fmod|mod|fth) /m('/"
cat maude-npa.maude | \
    grep -E '^(fmod|mod|fth|view)' | \
    sed 's/ is/)/' | \
    sed 's/ from.*//' | \
    sed 's/{.*//'  | \
    sed "s/view /v('/" | \
    sed "s/fmod /m('/" | \
    sed "s/mod /m('/" | \
    sed "s/fth /m('/"