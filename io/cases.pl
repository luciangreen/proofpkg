:- module(cases, [title/1, case/3]).
:- use_module('../prolog/proofpkg').
:- use_module(engine).
title('proofpkg').
pkg_g(P) :- findall(N, example(N, _, _), Ns), rnd_pick(Ns, N), example(N, Cs, Ps), make_package(N, Cs, Ps, P).
case(load, [P], load) :- pkg_g(P).
case(load_tampered, [P, I], load_tampered) :- pkg_g(P), P = pkg(_, Cs, _, _), length(Cs, L), Top is L - 1, rnd_int(0, Top, I).
case(load_rehashed, [P], load_rehashed) :- pkg_g(P).
case(solve_goal, [N, G], solve_goal) :- rnd_pick([lists-app([1, 2], [3], [1, 2, 3]), lists-app([1], X, [1, 2]), arith-quad(5, 20), arith-double(4, 9), lengths-len([x, y], 2)], N-G0), G0 = G, ( var(X) -> true ; true ).
case(hash, [N], hash) :- findall(N0, example(N0, _, _), Ns), rnd_pick(Ns, N).
load_tampered(P, I, R) :- tamper_clause(P, I, Q), load(Q, R).
load_rehashed(P, R) :- tamper_hash(P, Q), load(Q, R).
solve_goal(N, G, R) :- example(N, Cs, _), ( once(solve(Cs, G, 100)) -> R = proved(G) ; R = not_proved ).
hash(N, H) :- example(N, Cs, Ps), hash_of(Cs, Ps, H).
