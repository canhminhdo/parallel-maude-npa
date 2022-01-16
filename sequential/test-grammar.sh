#!/bin/zsh
time maude << EOF
in maude-npa.maude
in examples/API-Protocols/YubiKey/YubiKey.maude
select MAUDE-NPA .
red displayGrammars .
EOF
