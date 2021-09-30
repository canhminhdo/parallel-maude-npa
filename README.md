### Parallel Maude-NPA for Cryptographic Protocol Analysis
---

Maude-NPA is a narrowing-based model checker for analyz-ing cryptographic protocols
in the Dolev-Yao strand space model modulo equations, which starts from an attack state
to find counterexamples by performing a backward narrowing reachability analysis.

Maude-NPA basically uses a breadth-first search (BFS) to explore the state space.
Given a set of states in layer l, for each state in the set, we can perform independently
the backward narrowing to obtain its successor states in layer l + 1, which opens an opportunity
for parallelization so as to mitigate the state space explosion problem. If the number of states
located at each layer is considerable, our parallel version of Maude-NPA can improve effectively
the running performance of Maude-NPA.

## How to use the parallel version of Maude-NPA

All what we need to configure resides in `server-command.sh` and `client-command.sh` files.

All examples are available in `examples` folder also.

### 1. Start the master server

The following is the content of `server-commands.sh` file where you can specify:
<ul>
<li>the protocol</li>
<li>the number of workers</li>
<li>the number of backward steps</li>
<li>the attack state id</li>
<li>...</li>
</ul>

```
#!/bin/zsh
time maude << EOF
in server.maude
load examples/Exclusive-OR-Protocols/tmn/ltv-F-tmn-asy.maude
select PARALLEL-MAUDE-NPA .
load debug.maude
erew <> < aServer : Server | status : idle, attack : 0, bStep : unbounded, step : 1, #workers : 8 >
        CreateServerTcpSocket(socketManager, aServer, 9000, 10) .
EOF
```

### 2. Start a worker

The following is the content of `client-commands.sh` file where you can specify:
<ul>
<li>the protocol</li>
<li>the attack state id</li>
<li>the number of backward steps</li>
<li>the batchSize, the number of states are sent at the same time to the master.</li>
<li>...</li>
</ul>

Each worker should be run in a separated terminal.

```
#!/bin/zsh
time maude << EOF
in client.maude
in examples/Exclusive-OR-Protocols/tmn/ltv-F-tmn-asy.maude
select PARALLEL-MAUDE-NPA .
in debug.maude
erew <> p-run(0, unbounded, aClient)
        < aClient : Client | status : idle, batchSize : 1 >
        CreateClientTcpSocket(socketManager, aClient, "localhost", 9000) .
EOF
```