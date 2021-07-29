#!/bin/zsh
time maude << EOF
in maude-npa.maude
in examples/Needham_Schroeder.maude
select MAUDE-NPA .
red run(0, unbounded) .
EOF