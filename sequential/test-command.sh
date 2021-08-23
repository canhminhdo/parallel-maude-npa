#!/bin/zsh
time maude << EOF
in maude-npa.maude
load examples/Needham_Schroeder.maude
select MAUDE-NPA .
red run(0, unbounded) .
EOF

# red run(0, 7) .
# red summary(1) .
# red summary(2) .
# red summary(3) .
# red summary(4) .
# red summary(5) .
# red summary(6) .
# red summary(7) .
# red summary(8) .
# red summary(9) .
# red summary(10) .
# red summary(11) .
# red summary(12) .
# red summary(13) .
# red summary(14) .
# red summary(15) .
# red summary(16) .
# red summary(17) .
# red summary(18) .
# red summary(19) .
# red summary(20) .