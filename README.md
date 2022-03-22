### A Parallel Version of Maude-NPA
---

Maude-NPA is a formal verification/analysis tool for
analyzing cryptographic protocols. It uses a Breadth-first
search (BFS) to explore the reachable state space. For each
layer, Maude-NPA conducts the following steps:

- Firstly, given a set of states in layer $l$, for each
state in the set, Maude-NPA performs the backward narrowing
just by one step to obtain its successor states in layer $l + 1$,
which is referred to as step (1).

- Secondly, as soon as the successor states at layer $l + 1$ are
obtained from step (1), Maude-NPA conducts the transition subsumption,
which is referred to as step (2). Basically, step (2) performs
two sub-steps as follows:

    - For each state in the successor states obtained
    from step (1), we check whether the state is implied by other states
    in the successor states, which is referred to as step (2.1).
    If so, the state is discarded. Otherwise, we keep
    the state. Once step (2.1) is complete, we obtain a new set of
    successor states such that no state is implied by other states.

    - For each state in the successor states obtained
    from step (2.1), we check whether the state is implied by some states
    in the history states, which is referred to as step (2.2).
    If so, the state is discarded. Otherwise, we keep the state.
    Once step (2.2) is complete, we obtain a new set of successor
    states such that no state is implied by any state in the history states.

- Thirdly, filtering state duplications and ruling out initial states as
counterexamples from the set of states obtained from step (2), which is
referred to as step (3).


The cycle repeats until there are any initial states (counterexamples),
a depth bound is reached, or no states are found for the next layer.

This repository contains a tool supporting the parallel version of Maude-NPA
in which steps (1), (2.1), and (2.2) are conducted in parallel. We are not
interested in parallelizing step (3).

### How to use the tool
---
The tool has been developed in Maude with meta-interpreters
based on a master-worker model. The following commands are used
to conduct the experiment for Needham Schroeder Lowe ECB protocol.

```
load maude-npa.maude
load parallel-maude-npa.maude
load examples/Homomorphism-Protocols/Needham_Schroeder_Lowe_ECB/Needham_Schroeder_Lowe_ECB.maude
select PARALLEL-MAUDE-NPA .
erew <> p-run(0, unbounded, 8) .
```

- `Step 1:` load `maude-npa.maude` file at line 1.
- `Step 2:` load `parallel-maude-npa.maude` file at line 2.
- `Step 3:` load the formal specification of a protocol specified in Maude-NPA
(e.g. Needham Schroeder Lowe ECB protocol) at line 3.
- `Step 4:` select `PARALLEL-MAUDE-NPA` module as default at line 4
- `Step 5:` conduct the analysis in parallel by using the command `p-run(<attack-state>, <depth-bound>, <#workers>)`

### Global parameters
---
There are two parameters in the tool:

- `simBatch` is the minimum number of states that should be assigned
to each worker at step (2.1).

- `simBatchH` is the minimum multiplication of the number of states
and history states that should be assigned to each worker at step (2.2).

By default, `simBatch` and `simBatchH` are set to 20 and 50, respectively.
You can change them in the `global.maude` file.