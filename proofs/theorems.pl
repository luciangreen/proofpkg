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

% 6. A seal stops deliberate changes: a package rebuilt with an extra clause and a new hash loads unsigned (the
%    hash alone cannot stop it), but is refused with the author's seal; the genuine signed package loads, and a
%    seal made with another key is refused.
theorem(seal_stops_rebuilt_packages) :-
    forall(( pkg(N, P), N \== false_claim ), ( sign(P, "author key", S), load_signed(S, "author key", loaded(N, _)),
        load_signed(S, "another key", refused(seal_mismatch)), S = signed(P, Seal), rebuild(P, (evil :- true), Q),
        load(Q, loaded(N, _)), load_signed(signed(Q, Seal), "author key", refused(seal_mismatch)) )).

% 7. The hash is SHA-256: the published test values come out.
theorem(sha256_test_values) :-
    utf8_bytes('', E), sha256(E, D0), hex(D0, "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"),
    utf8_bytes(abc, A), sha256(A, D1), hex(D1, "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"),
    utf8_bytes(key, K), utf8_bytes('The quick brown fox jumps over the lazy dog', M), hmac_sha256(K, M, Mac),
    hex(Mac, "f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8").
