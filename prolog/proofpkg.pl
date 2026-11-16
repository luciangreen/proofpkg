% proofpkg: a package format where code ships with its proofs. A package holds its clauses, the
% goals that prove them (tests run by a small meta-interpreter over just those clauses) and a
% hash of both. The loader refuses anything whose hash doesn't match or whose proofs don't
% all succeed, so unproven or tampered code never runs.
%?- make_package(lists, [ (app([], L, L) :- true), (app([H|T], L, [H|R]) :- app(T, L, R)) ], [app([1], [2], [1,2])], P), load(P, R).   % R = loaded(lists, 1)
%?- tamper_hash(P, Q), load(Q, R).        % R = refused(hash_mismatch)
:- module(proofpkg, [make_package/4, hash_of/3, load/2, solve/3, tamper_clause/3, tamper_hash/2, example/3]).
:- use_module(library(lists)).
:- use_module(library(apply)).

% hash_of(+Clauses, +Proofs, -H): a portable hash of the package's text (31-multiplier, mod 1000000007).
hash_of(Cs, Ps, H) :- copy_term(Cs-Ps, T), numbervars(T, 0, _), format(string(S), "~q", [T]), string_codes(S, Codes),
    foldl([C, A, B]>>(B is (A * 31 + C) mod 1000000007), Codes, 17, H).

make_package(Name, Cs, Ps, pkg(Name, Cs, Ps, H)) :- hash_of(Cs, Ps, H).

% load(+Package, -Result): loaded(Name, NumberOfProofs), or refused(Why).
load(pkg(Name, Cs, Ps, H), R) :-
    (   \+ hash_of(Cs, Ps, H) -> R = refused(hash_mismatch)
    ;   member(G, Ps), \+ once(solve(Cs, G, 2000)) -> R = refused(proof_failed(G))
    ;   length(Ps, N), R = loaded(Name, N) ).

% solve(+Clauses, +Goal, +Depth): proves Goal from Clauses (and arithmetic), up to Depth steps.
solve(_, true, _) :- !.
solve(Cs, (A, B), D) :- !, solve(Cs, A, D), solve(Cs, B, D).
solve(_, G, _) :- builtin(G), !, call(G).
solve(Cs, G, D) :- D > 0, D1 is D - 1, member(C, Cs), copy_term(C, (H :- B)), H = G, solve(Cs, B, D1).
builtin(G) :- functor(G, F, A), memberchk(F/A, [(is)/2, (=)/2, (<)/2, (>)/2, (=<)/2, (>=)/2, (=:=)/2, (==)/2]).

% Ways a package gets changed after it was made (for checking the loader catches them).
tamper_clause(pkg(N, Cs, Ps, H), I, pkg(N, Cs2, Ps, H)) :- nth0(I, Cs, _), length(Pre, I), append(Pre, [_|Post], Cs), append(Pre, [(evil :- true)|Post], Cs2).
tamper_hash(pkg(N, Cs, Ps, H), pkg(N, Cs, Ps, H2)) :- H2 is (H + 1) mod 1000000007.

% Example packages: some whose proofs hold, one whose proof is false.
example(lists, [ (app([], L, L) :- true), (app([H|T], L, [H|R]) :- app(T, L, R)) ], [app([1], [2], [1, 2]), app([], [], [])]).
example(arith, [ (double(X, Y) :- Y is 2 * X), (quad(X, Z) :- double(X, Y), double(Y, Z)) ], [quad(3, 12), double(0, 0)]).
example(lengths, [ (len([], 0) :- true), (len([_|T], N) :- len(T, M), N is M + 1) ], [len([a, b, c], 3)]).
example(false_claim, [ (len([], 0) :- true), (len([_|T], N) :- len(T, M), N is M + 1) ], [len([a], 2)]).
