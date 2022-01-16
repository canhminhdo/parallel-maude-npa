#!/bin/zsh
time maude << EOF
load debug.maude
load maude-npa.maude
load parallel-maude-npa.maude
load examples/Symmetric-Key-Protocols/Diffie-Hellman/Diffie-Hellman.maude
select PARALLEL-MAUDE-NPA .
erew <> p-run(0, unbounded, 8) .
EOF