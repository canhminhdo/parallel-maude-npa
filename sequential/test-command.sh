#!/bin/zsh
time maude << EOF
in maude-npa.maude
load examples/Symmetric-Key-Protocols/Yahalom/Yahalom.maude
select MAUDE-NPA .
red run(0, 4) .
EOF