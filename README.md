# Turing-Machines

## 2 Symbol

This implementation will only have 2 symbol, variable state turing machines. This is an arbitrary choice, it's just a lot easier because, a it is very logically close to modern computers, and b, it's just easier to write.

## Infinite Tape

Because an infinite tape is not easily representable, the tape is continually added to as needed, otherwise it can be assumed as an infinite number of zeroes before and after this tape.

### Busy Beaver through turing_two_symbol

```
> turing_two_symbol:run([{a, {{r, 1, b}, {l, 1, b}}}, {b, {{l, 1, a},{h, h, h}}}], {[0], [0]}, a).
... 0 0 [1,1,1,1,0] 0 0 ...
ok
```

### Busy Beaver 2 State

```
> busy_beaver:run().
... 0 0 [1,1,1,1,0] 0 0 ...
ok
```

### Busy Beaver through turing_two_symbol 3 STATE

```
> turing_two_symbol:run([{a, {{r, 1, b}, {l, 1, c}}}, {b, {{l, 1, a},{r, 1, b}}}, {c, {{l, 1, b}, {h, 1, h}}}], {[0], [0]}, a).
... 0 0 [1,1,1,1,1,1,0] 0 0 ...
ok
```

### Busy Beaver through turing_multi_symbol 3 STATE

```
> turing_multi_symbol:run([{a, [{0, r, 1, b}, {1, l, 1, c}]}, {b, [{0, l, 1, a}, {1, r, 1, b}]}, {c, [{0, l, 1, b}, {1, h, 1, h}]}], {[0],[0]}, a).      
... 0 0 [1,1,1,1,1,1,0] 0 0 ...
```

#### With Debug
```
>  turing_multi_symbol:run([{a, [{0, r, 1, b}, {1, l, 1, c}]}, {b, [{0, l, 1, a}, {1, r, 1, b}]}, {c, [{0, l, 1, b}, {1, h, 1, h}]}], {[0],[0]}, a, true).
... 0 0 [0,0] 0 0 ...
Current Tape Rule: {0,r,1,b}
... 0 0 [1,0,0] 0 0 ...
Current Tape Rule: {0,l,1,a}
... 0 0 [1,1,0] 0 0 ...
Current Tape Rule: {1,l,1,c}
... 0 0 [0,1,1,0] 0 0 ...
Current Tape Rule: {0,l,1,b}
... 0 0 [0,1,1,1,0] 0 0 ...
Current Tape Rule: {0,l,1,a}
... 0 0 [0,1,1,1,1,0] 0 0 ...
Current Tape Rule: {0,r,1,b}
... 0 0 [1,1,1,1,1,0] 0 0 ...
Current Tape Rule: {1,r,1,b}
... 0 0 [1,1,1,1,1,0] 0 0 ...
Current Tape Rule: {1,r,1,b}
... 0 0 [1,1,1,1,1,0] 0 0 ...
Current Tape Rule: {1,r,1,b}
... 0 0 [1,1,1,1,1,0] 0 0 ...
Current Tape Rule: {1,r,1,b}
... 0 0 [1,1,1,1,1,0,0] 0 0 ...
Current Tape Rule: {0,l,1,a}
... 0 0 [1,1,1,1,1,1,0] 0 0 ...
Current Tape Rule: {1,l,1,c}
... 0 0 [1,1,1,1,1,1,0] 0 0 ...
Current Tape Rule: {1,h,1,h}
... 0 0 [1,1,1,1,1,1,0] 0 0 ...
```
