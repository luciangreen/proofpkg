# proofpkg

a package format where code ships with its proofs. A package holds its clauses, the goals that prove them (tests run by a small meta-interpreter over just those clauses) and a hash of both. The loader refuses anything whose hash doesn't match or whose proofs don't all succeed, so unproven or tampered code never runs.

## Use

```prolog
?- use_module(prolog/proofpkg).
?- make_package(lists, [ (app([], L, L) :- true), (app([H|T], L, [H|R]) :- app(T, L, R)) ], [app([1], [2], [1,2])], P), load(P, R).   % R = loaded(lists, 1)
?- tamper_hash(P, Q), load(Q, R).        % R = refused(hash_mismatch)
```

## Proofs

`proofs/theorems.pl` proves 5 theorems by exhaustion: each one is checked for every case in a finite domain that covers every branch of the definitions. every example package; every way of replacing one clause, and of changing the hash.

1. A package whose proofs hold loads, reporting how many proofs it checked.
2. A package with a false proof is refused, naming the proof.
3. Changing any clause after the package was made is caught.
4. Changing the hash is caught.
5. The hash ignores variable names (a renamed copy has the same hash) and loading is deterministic.

```sh
swipl -g main -t halt proofs/theorems.pl
```

## 200 inputs and outputs

`io/ios.txt` lists 200 inputs and outputs from real runs, and `io/ios.pl` has the same as Prolog facts. The inputs come from a fixed seed (`io/cases.pl`). `swipl -g check -t halt io/run.pl` runs them again. It fails if any output changes, or if a predicate doesn't confirm its own recorded output, which checks steadfastness. GitHub Actions runs the proofs and the examples on every push, and records the examples on the first push.

Licence: BSD-3-Clause.
