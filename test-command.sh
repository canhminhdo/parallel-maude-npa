#!/bin/zsh
time maude << EOF
in parallel-maude-npa.maude
in examples/Needham_Schroeder.maude
select PARALLEL-MAUDE-NPA .
set print attribute off .
erew <> p-run(0, unbounded, 10, 6) .
EOF