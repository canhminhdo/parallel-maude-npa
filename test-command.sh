#!/bin/zsh
time maude << EOF
load debug.maude
load maude-npa.maude
load parallel-maude-npa.maude
load examples/Homomorphism-Protocols/Needham_Schroeder_Lowe_ECB/Needham_Schroeder_Lowe_ECB.maude
select PARALLEL-MAUDE-NPA .
erew <> p-run(0, unbounded, 8) .
EOF