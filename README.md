# Turing-Machines

### Busy Beaver through loadable_turing_machine

```
loadable_turing_machine:run([{a, {{r, 1, b}, {l, 1, b}}}, {b, {{l, 1, a},{h, h, h}}}], {[0], [0]}, a).
```

### Busy Beaver 2 State

```
busy_beaver:run().
```

### Busy Beaver through loadable_turing_machine 3 STATE

```
loadable_turing_machine:run([{a, {{r, 1, b}, {l, 1, c}}}, {b, {{l, 1, a},{r, 1, b}}}, {c, {{l, 1, b}, {h, 1, h}}}], {[0], [0]}, a).
```
