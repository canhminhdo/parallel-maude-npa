#!/bin/zsh
time maude << EOF
load debug.maude
load maude-npa-3.1.5.maude
load parallel-maude-npa.maude
load examples/Distance-Bounding-Protocols/brands-chaum.maude
select PARALLEL-MAUDE-NPA .
erew <> p-run(1, unbounded, 8) .
EOF