#!/bin/zsh
time maude << EOF
in maude-npa.maude
in ../examples/Needham_Schroeder_Lowe_ECB.maude
select MAUDE-NPA .
red run(0, unbounded) .
EOF