# proofpkg

a package format where code ships with its proofs. A package holds its clauses, the goals that prove them (tests run by a small meta-interpreter over just those clauses) and a hash of both. The loader refuses anything whose hash doesn't match or whose proofs don't all succeed, so unproven or accidentally changed code never runs. The hash is SHA-256 (written in plain Prolog, so it is the same on every Prolog); since anyone can work a hash out again, a deliberate change with a new hash would still load, so sign/3 adds an HMAC-SHA-256 seal made with the author's secret key, and load_signed/3 refuses any package whose seal does not match. (A seal is checked with the same key, so it suits packages passed between people who share it; a public-key signature would let anyone check.)

## Use

```prolog
?- use_module(prolog/proofpkg).
?- make_package(lists, [ (app([], L, L) :- true), (app([H|T], L, [H|R]) :- app(T, L, R)) ], [app([1], [2], [1,2])], P), load(P, R).   % R = loaded(lists, 1)
?- tamper_hash(P, Q), load(Q, R).        % R = refused(hash_mismatch)
?- sign(P, "my secret", S), S = signed(P0, Seal), rebuild(P0, (evil :- true), Q), load(Q, R1), load_signed(signed(Q, Seal), "my secret", R2).   % R1 = loaded(lists, 1), R2 = refused(seal_mismatch)
```

## Proofs

`proofs/theorems.pl` proves 7 theorems by exhaustion: each one is checked for every case in a finite domain that covers every branch of the definitions. every example package; every way of replacing one clause, and of changing the hash.

1. A package whose proofs hold loads, reporting how many proofs it checked.
2. A package with a false proof is refused, naming the proof.
3. Changing any clause after the package was made is caught.
4. Changing the hash is caught.
5. The hash ignores variable names (a renamed copy has the same hash) and loading is deterministic.
6. A seal stops deliberate changes: a package rebuilt with an extra clause and a new hash loads unsigned, but is refused with the author's seal, and a seal made with another key is refused.
7. The hash is SHA-256 and the seal HMAC-SHA-256: the published test values come out.

```sh
swipl -g main -t halt proofs/theorems.pl
```

## 200 inputs and outputs

`io/ios.txt` lists 200 inputs and outputs from real runs, and `io/ios.pl` has the same as Prolog facts. The inputs come from a fixed seed (`io/cases.pl`). `swipl -g check -t halt io/run.pl` runs them again. It fails if any output changes, or if a predicate doesn't confirm its own recorded output, which checks steadfastness. GitHub Actions runs the proofs and the examples on every push, and records the examples on the first push.

Licence: BSD-3-Clause.
