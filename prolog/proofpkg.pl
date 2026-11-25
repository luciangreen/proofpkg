% proofpkg: a package format where code ships with its proofs. A package holds its clauses, the
% goals that prove them (tests run by a small meta-interpreter over just those clauses) and a
% hash of both. The loader refuses anything whose hash doesn't match or whose proofs don't
% all succeed, so unproven or tampered code never runs.
%?- make_package(lists, [ (app([], L, L) :- true), (app([H|T], L, [H|R]) :- app(T, L, R)) ], [app([1], [2], [1,2])], P), load(P, R).   % R = loaded(lists, 1)
%?- tamper_hash(P, Q), load(Q, R).        % R = refused(hash_mismatch)
%?- sign(P, "my secret", S), S = signed(P0, Seal), rebuild(P0, (evil :- true), Q), load(Q, R1), load_signed(signed(Q, Seal), "my secret", R2).   % R1 = loaded(lists, 1): the hash was redone; R2 = refused(seal_mismatch)
:- module(proofpkg, [sign/3, load_signed/3, rebuild/3, sha256/2, hmac_sha256/3, hex/2, utf8_bytes/2, make_package/4, hash_of/3, load/2, solve/3, tamper_clause/3, tamper_hash/2, example/3]).
:- use_module(library(lists)).
:- use_module(library(apply)).

% hash_of(+Clauses, +Proofs, -H): the SHA-256 of the package's text (variables numbered), as a hex string.
% It catches accidental changes; anyone can work it out again, so it cannot stop deliberate ones: for
% those, sign/3 adds an HMAC-SHA-256 seal made with the author's secret key, which load_signed/3 checks.
hash_of(Cs, Ps, H) :- package_text(Cs-Ps, S), utf8_bytes(S, Bs), sha256(Bs, D), hex(D, H).
package_text(T0, S) :- copy_term(T0, T), numbervars(T, 0, _), format(string(S), "~q", [T]).

% sign(+Package, +Key, -Signed): signed(Package, Seal), Seal the HMAC-SHA-256 (hex) of the name and hash.
sign(pkg(N, Cs, Ps, H), Key, signed(pkg(N, Cs, Ps, H), Seal)) :- seal(N, H, Key, Seal).
seal(N, H, Key, Seal) :- utf8_bytes(Key, K), format(string(T), "~q", [N-H]), utf8_bytes(T, M), hmac_sha256(K, M, Mac), hex(Mac, Seal).
% load_signed(+Signed, +Key, -Result): refused(seal_mismatch) unless the seal is the key's seal of this
% package's name and its real hash; then as load/2. A package rebuilt with a new hash keeps a seal that no
% longer matches, and a seal cannot be made again without the key.
load_signed(signed(pkg(N, Cs, Ps, H), Seal), Key, R) :- hash_of(Cs, Ps, H1),
    (   seal(N, H1, Key, Seal1), Seal1 == Seal -> load(pkg(N, Cs, Ps, H), R)
    ;   R = refused(seal_mismatch) ).

% ---- SHA-256 (FIPS 180-4) and HMAC-SHA-256 (RFC 2104) in plain Prolog, on lists of bytes, so the same
% digest comes out on every Prolog (checked against the published test values).
k_consts([0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
          0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
          0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
          0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
          0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
          0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
          0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
          0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2]).
h0([0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19]).

% sha256(+Bytes, -Digest): Digest is a list of 32 bytes.
sha256(Bytes, Digest) :- sha_pad(Bytes, Padded), h0(H0), sha_blocks(Padded, H0, H), maplist(word_bytes, H, Bs), append(Bs, Digest).
sha_pad(Bytes, Padded) :- length(Bytes, L), Bits is L * 8, Z is (55 - L) mod 64, length(Zs, Z), maplist(=(0), Zs),
    word64_bytes(Bits, LBs), append([Bytes, [0x80], Zs, LBs], Padded).
word64_bytes(N, Bs) :- numlist(0, 7, Is), reverse(Is, Rs), maplist([I, B]>>(B is (N >> (8 * I)) /\ 255), Rs, Bs).
word_bytes(W, [A, B, C, D]) :- A is (W >> 24) /\ 255, B is (W >> 16) /\ 255, C is (W >> 8) /\ 255, D is W /\ 255.
sha_blocks([], H, H) :- !.
sha_blocks(Bytes, H0, H) :- length(Block, 64), append(Block, Rest, Bytes), sha_block(Block, H0, H1), sha_blocks(Rest, H1, H).
bytes_words([], []).
bytes_words([A, B, C, D|T], [W|Ws]) :- W is (A << 24) \/ (B << 16) \/ (C << 8) \/ D, bytes_words(T, Ws).
rotr(X, N, Y) :- Y is ((X >> N) \/ (X << (32 - N))) /\ 0xFFFFFFFF.
schedule(W16, W64) :- reverse(W16, R), extend(16, R, Rev), reverse(Rev, W64).
extend(64, R, R) :- !.
extend(I, R, Out) :- nth0(1, R, W2), nth0(6, R, W7), nth0(14, R, W15), nth0(15, R, W16),
    rotr(W15, 7, A1), rotr(W15, 18, A2), S0 is A1 xor A2 xor (W15 >> 3),
    rotr(W2, 17, B1), rotr(W2, 19, B2), S1 is B1 xor B2 xor (W2 >> 10),
    W is (W16 + S0 + W7 + S1) /\ 0xFFFFFFFF, I1 is I + 1, extend(I1, [W|R], Out).
sha_block(Block, H0, H) :- bytes_words(Block, W16), schedule(W16, Ws), k_consts(Ks),
    foldl(sha_round, Ks, Ws, H0, S), maplist([X, Y, Z]>>(Z is (X + Y) /\ 0xFFFFFFFF), H0, S, H).
sha_round(K, W, [A, B, C, D, E, F, G, H], [A2, A, B, C, E2, E, F, G]) :-
    rotr(E, 6, E1), rotr(E, 11, E2a), rotr(E, 25, E3), S1 is E1 xor E2a xor E3,
    Ch is (E /\ F) xor ((E xor 0xFFFFFFFF) /\ G),
    T1 is (H + S1 + Ch + K + W) /\ 0xFFFFFFFF,
    rotr(A, 2, A1), rotr(A, 13, A2b), rotr(A, 22, A3), S0 is A1 xor A2b xor A3,
    Maj is (A /\ B) xor (A /\ C) xor (B /\ C),
    T2 is (S0 + Maj) /\ 0xFFFFFFFF,
    E2 is (D + T1) /\ 0xFFFFFFFF, A2 is (T1 + T2) /\ 0xFFFFFFFF.

% hmac_sha256(+KeyBytes, +MessageBytes, -Mac): RFC 2104, block size 64.
hmac_sha256(Key0, Msg, Mac) :- length(Key0, KL), ( KL > 64 -> sha256(Key0, Key1) ; Key1 = Key0 ),
    length(Key1, L1), P is 64 - L1, length(Pad, P), maplist(=(0), Pad), append(Key1, Pad, Key),
    maplist([X, Y]>>(Y is X xor 0x36), Key, IK), maplist([X, Y]>>(Y is X xor 0x5c), Key, OK),
    append(IK, Msg, In), sha256(In, IH), append(OK, IH, Out), sha256(Out, Mac).

% utf8_bytes(+Text, -Bytes): the UTF-8 encoding of a string or atom.
utf8_bytes(T, Bs) :- atom_codes(T, Cs), foldl([C, A0, A]>>( utf8(C, B), append(A0, B, A) ), Cs, [], Bs).
utf8(C, [C]) :- C < 0x80, !.
utf8(C, [B1, B2]) :- C < 0x800, !, B1 is 0xC0 \/ (C >> 6), B2 is 0x80 \/ (C /\ 0x3F).
utf8(C, [B1, B2, B3]) :- C < 0x10000, !, B1 is 0xE0 \/ (C >> 12), B2 is 0x80 \/ ((C >> 6) /\ 0x3F), B3 is 0x80 \/ (C /\ 0x3F).
utf8(C, [B1, B2, B3, B4]) :- B1 is 0xF0 \/ (C >> 18), B2 is 0x80 \/ ((C >> 12) /\ 0x3F), B3 is 0x80 \/ ((C >> 6) /\ 0x3F), B4 is 0x80 \/ (C /\ 0x3F).
hex(Bytes, Hex) :- atom_codes('0123456789abcdef', Ds), foldl([B, A0, A]>>( Hi is B >> 4, Lo is B /\ 15, nth0(Hi, Ds, C1), nth0(Lo, Ds, C2), append(A0, [C1, C2], A) ), Bytes, [], Cs), string_codes(Hex, Cs).


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
tamper_hash(pkg(N, Cs, Ps, H), pkg(N, Cs, Ps, H2)) :- string_codes(H, [C|Rest]), ( C =:= 0'0 -> C2 = 0'1 ; C2 = 0'0 ), string_codes(H2, [C2|Rest]).
% rebuild(+Package, +Clause, -Rebuilt): a deliberate change, a clause added and the hash worked out again,
% so the hash matches and every proof still passes: only a seal can catch it.
rebuild(pkg(N, Cs, Ps, _), C, pkg(N, Cs2, Ps, H2)) :- append(Cs, [C], Cs2), hash_of(Cs2, Ps, H2).

% Example packages: some whose proofs hold, one whose proof is false.
example(lists, [ (app([], L, L) :- true), (app([H|T], L, [H|R]) :- app(T, L, R)) ], [app([1], [2], [1, 2]), app([], [], [])]).
example(arith, [ (double(X, Y) :- Y is 2 * X), (quad(X, Z) :- double(X, Y), double(Y, Z)) ], [quad(3, 12), double(0, 0)]).
example(lengths, [ (len([], 0) :- true), (len([_|T], N) :- len(T, M), N is M + 1) ], [len([a, b, c], 3)]).
example(false_claim, [ (len([], 0) :- true), (len([_|T], N) :- len(T, M), N is M + 1) ], [len([a], 2)]).
