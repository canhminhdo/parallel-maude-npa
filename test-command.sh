#!/bin/zsh
time maude << EOF
load debug.maude
load maude-npa.maude
load parallel-maude-npa.maude
load examples/PKCS-Standards/pkcs11/PKCS11_a3-noComp.maude
select PARALLEL-MAUDE-NPA .
erew <> p-run(0, unbounded, 8) .
EOF