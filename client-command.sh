#!/bin/zsh
time maude << EOF
in client.maude
in examples/Exclusive-OR-Protocols/tmn/ltv-F-tmn-asy.maude
select PARALLEL-MAUDE-NPA .
in debug.maude
erew <> p-run(0, unbounded, aClient)
        < aClient : Client | status : idle, batchSize : 10 >
        CreateClientTcpSocket(socketManager, aClient, "localhost", 9000) .
EOF