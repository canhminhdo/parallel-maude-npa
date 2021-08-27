#!/bin/zsh
time maude << EOF
in server.maude
load examples/Exclusive-OR-Protocols/tmn/ltv-F-tmn-asy.maude
select PARALLEL-MAUDE-NPA .
load debug.maude
erew <> < aServer : Server | status : idle, attack : 0, bStep : unbounded, step : 1, #workers : 4 >
        CreateServerTcpSocket(socketManager, aServer, 9000, 10) .
EOF