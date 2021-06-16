#!/bin/zsh
time maude << EOF
in parallel-maude-npa.maude
in examples/Needham_Schroeder_Lowe_ECB.maude
select PARALLEL-MAUDE-NPA .
set print attribute on .
erew <> < aManager : Manager | nWorkers : 4, status : idle >
        p-run(0, unbounded) .
EOF