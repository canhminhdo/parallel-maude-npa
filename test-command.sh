#!/bin/zsh
time maude << EOF
load debug.maude
load maude-npa.maude
load parallel-maude-npa.maude
load examples/Symmetric-Key-Protocols/Amended_Needham-Schroeder/Amended_Needham-Schroeder.maude
select PARALLEL-MAUDE-NPA .
erew <> p-run(0, unbounded, 24) .
EOF

# load examples/Symmetric-Key-Protocols/Amended_Needham-Schroeder/Amended_Needham-Schroeder.maude
# load examples/API-Protocols/YubiKey/YubiKey.maude
# load examples/Choice-Protocols/TLS-regular.maude