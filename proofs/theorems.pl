% Theorems about proofpkg, proved by exhaustion. Run: swipl -g main -t halt proofs/theorems.pl
:- module(theorems, [main/0]).
:- use_module('../prolog/proofpkg').
:- use_module(prove).
:- discontiguous theorem/1.
:- use_module(library(lists)).
:- use_module(library(apply)).
main :- prove_all(theorems).

% Domain: every example package; every way of replacing one clause, and of changing the hash.
pkg(N, P) :- example(N, Cs, Ps), make_package(N, Cs, Ps, P).

% 1. A package whose proofs hold loads, reporting how many proofs it checked.
theorem(proved_packages_load) :- forall(( pkg(N, P), N \== false_claim ), ( load(P, loaded(N, K)), P = pkg(_, _, Ps, _), length(Ps, K) )).

% 2. A package with a false proof is refused, naming the proof.
theorem(false_proofs_refused) :- forall(pkg(false_claim, P), load(P, refused(proof_failed(_)))).

% 3. Changing any clause after the package was made is caught.
theorem(tampered_clauses_refused) :- forall(( pkg(_, P), tamper_clause(P, _, Q) ), load(Q, refused(_))).

% 4. Changing the hash is caught.
theorem(tampered_hash_refused) :- forall(( pkg(_, P), tamper_hash(P, Q) ), load(Q, refused(hash_mismatch))).

% 5. The hash ignores variable names (a renamed copy has the same hash) and loading is deterministic.
theorem(hash_is_canonical_and_load_deterministic) :-
    forall(( pkg(_, P), P = pkg(_, Cs, Ps, H) ), ( copy_term(Cs-Ps, Cs2-Ps2), hash_of(Cs2, Ps2, H), findall(R, load(P, R), [_]) )).
