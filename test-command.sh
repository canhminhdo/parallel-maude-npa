#!/bin/zsh
time maude << EOF
in parallel-maude-npa.maude
in examples/Needham_Schroeder.maude
select PARALLEL-MAUDE-NPA .
set print attribute on .
erew <> p-run(0, unbounded, 4, 1) .
EOF