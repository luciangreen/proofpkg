% 200 recorded inputs and outputs (swipl -g record -t halt io/run.pl writes this; check compares).
io(1, load, [pkg(lengths, [(len([], 0):-true), (len([_232|_234], _228):-len(_234, _246), _228 is _246+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(2, load_tampered, [pkg(lists, [(app([], _352, _352):-true), (app([_378|_380], _352, [_378|_386]):-app(_380, _352, _386))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 0], refused(hash_mismatch)).
io(3, load_rehashed, [pkg(false_claim, [(len([], 0):-true), (len([_522|_524], _518):-len(_524, _536), _518 is _536+1)], [len([a], 2)], 250580892)], refused(hash_mismatch)).
io(4, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(5, hash, [lists], 619914534).
io(6, load, [pkg(lengths, [(len([], 0):-true), (len([_714|_716], _710):-len(_716, _728), _710 is _728+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(7, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_854|_856], _850):-len(_856, _868), _850 is _868+1)], [len([a, b, c], 3)], 71780219), 0], refused(hash_mismatch)).
io(8, load_rehashed, [pkg(arith, [(double(_962, _964):-_964 is 2*_962), (quad(_962, _994):-double(_962, _964), double(_964, _994))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(9, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(10, hash, [lists], 619914534).
io(11, load, [pkg(lengths, [(len([], 0):-true), (len([_1184|_1186], _1180):-len(_1186, _1198), _1180 is _1198+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(12, load_tampered, [pkg(lists, [(app([], _1302, _1302):-true), (app([_1328|_1330], _1302, [_1328|_1336]):-app(_1330, _1302, _1336))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 1], refused(hash_mismatch)).
io(13, load_rehashed, [pkg(false_claim, [(len([], 0):-true), (len([_1472|_1474], _1468):-len(_1474, _1486), _1468 is _1486+1)], [len([a], 2)], 250580892)], refused(hash_mismatch)).
io(14, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(15, hash, [arith], 168790322).
io(16, load, [pkg(lengths, [(len([], 0):-true), (len([_1690|_1692], _1686):-len(_1692, _1704), _1686 is _1704+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(17, load_tampered, [pkg(arith, [(double(_1806, _1808):-_1808 is 2*_1806), (quad(_1806, _1838):-double(_1806, _1808), double(_1808, _1838))], [quad(3, 12), double(0, 0)], 168790322), 0], refused(hash_mismatch)).
io(18, load_rehashed, [pkg(lists, [(app([], _1934, _1934):-true), (app([_1960|_1962], _1934, [_1960|_1968]):-app(_1962, _1934, _1968))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(19, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(20, hash, [false_claim], 250580892).
io(21, load, [pkg(arith, [(double(_2152, _2154):-_2154 is 2*_2152), (quad(_2152, _2184):-double(_2152, _2154), double(_2154, _2184))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(22, load_tampered, [pkg(lists, [(app([], _2288, _2288):-true), (app([_2314|_2316], _2288, [_2314|_2322]):-app(_2316, _2288, _2322))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 0], refused(hash_mismatch)).
io(23, load_rehashed, [pkg(arith, [(double(_2434, _2436):-_2436 is 2*_2434), (quad(_2434, _2466):-double(_2434, _2436), double(_2436, _2466))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(24, solve_goal, [arith, double(4, 9)], not_proved).
io(25, hash, [lengths], 71780219).
io(26, load, [pkg(lists, [(app([], _2618, _2618):-true), (app([_2644|_2646], _2618, [_2644|_2652]):-app(_2646, _2618, _2652))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], loaded(lists, 2)).
io(27, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_2796|_2798], _2792):-len(_2798, _2810), _2792 is _2810+1)], [len([a, b, c], 3)], 71780219), 0], refused(hash_mismatch)).
io(28, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_2928|_2930], _2924):-len(_2930, _2942), _2924 is _2942+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(29, solve_goal, [lists, app([1], [2], [1, 2])], proved(app([1], [2], [1, 2]))).
io(30, hash, [lists], 619914534).
io(31, load, [pkg(lengths, [(len([], 0):-true), (len([_3140|_3142], _3136):-len(_3142, _3154), _3136 is _3154+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(32, load_tampered, [pkg(lists, [(app([], _3258, _3258):-true), (app([_3284|_3286], _3258, [_3284|_3292]):-app(_3286, _3258, _3292))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 0], refused(hash_mismatch)).
io(33, load_rehashed, [pkg(arith, [(double(_3404, _3406):-_3406 is 2*_3404), (quad(_3404, _3436):-double(_3404, _3406), double(_3406, _3436))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(34, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(35, hash, [false_claim], 250580892).
io(36, load, [pkg(lengths, [(len([], 0):-true), (len([_3626|_3628], _3622):-len(_3628, _3640), _3622 is _3640+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(37, load_tampered, [pkg(arith, [(double(_3742, _3744):-_3744 is 2*_3742), (quad(_3742, _3774):-double(_3742, _3744), double(_3744, _3774))], [quad(3, 12), double(0, 0)], 168790322), 1], refused(hash_mismatch)).
io(38, load_rehashed, [pkg(lists, [(app([], _3870, _3870):-true), (app([_3896|_3898], _3870, [_3896|_3904]):-app(_3898, _3870, _3904))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(39, solve_goal, [arith, quad(5, 20)], proved(quad(5, 20))).
io(40, hash, [lengths], 71780219).
io(41, load, [pkg(lengths, [(len([], 0):-true), (len([_4100|_4102], _4096):-len(_4102, _4114), _4096 is _4114+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(42, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_4240|_4242], _4236):-len(_4242, _4254), _4236 is _4254+1)], [len([a], 2)], 250580892), 1], refused(hash_mismatch)).
io(43, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_4360|_4362], _4356):-len(_4362, _4374), _4356 is _4374+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(44, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(45, hash, [lists], 619914534).
io(46, load, [pkg(arith, [(double(_4566, _4568):-_4568 is 2*_4566), (quad(_4566, _4598):-double(_4566, _4568), double(_4568, _4598))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(47, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_4724|_4726], _4720):-len(_4726, _4738), _4720 is _4738+1)], [len([a, b, c], 3)], 71780219), 0], refused(hash_mismatch)).
io(48, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_4856|_4858], _4852):-len(_4858, _4870), _4852 is _4870+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(49, solve_goal, [arith, quad(5, 20)], proved(quad(5, 20))).
io(50, hash, [lengths], 71780219).
io(51, load, [pkg(arith, [(double(_5024, _5026):-_5026 is 2*_5024), (quad(_5024, _5056):-double(_5024, _5026), double(_5026, _5056))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(52, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_5182|_5184], _5178):-len(_5184, _5196), _5178 is _5196+1)], [len([a, b, c], 3)], 71780219), 0], refused(hash_mismatch)).
io(53, load_rehashed, [pkg(arith, [(double(_5290, _5292):-_5292 is 2*_5290), (quad(_5290, _5322):-double(_5290, _5292), double(_5292, _5322))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(54, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(55, hash, [lists], 619914534).
io(56, load, [pkg(arith, [(double(_5514, _5516):-_5516 is 2*_5514), (quad(_5514, _5546):-double(_5514, _5516), double(_5516, _5546))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(57, load_tampered, [pkg(lists, [(app([], _5650, _5650):-true), (app([_5676|_5678], _5650, [_5676|_5684]):-app(_5678, _5650, _5684))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 1], refused(hash_mismatch)).
io(58, load_rehashed, [pkg(lists, [(app([], _5798, _5798):-true), (app([_5824|_5826], _5798, [_5824|_5832]):-app(_5826, _5798, _5832))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(59, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(60, hash, [false_claim], 250580892).
io(61, load, [pkg(false_claim, [(len([], 0):-true), (len([_6040|_6042], _6036):-len(_6042, _6054), _6036 is _6054+1)], [len([a], 2)], 250580892)], refused(proof_failed(len([a], 2)))).
io(62, load_tampered, [pkg(arith, [(double(_6146, _6148):-_6148 is 2*_6146), (quad(_6146, _6178):-double(_6146, _6148), double(_6148, _6178))], [quad(3, 12), double(0, 0)], 168790322), 0], refused(hash_mismatch)).
io(63, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_6296|_6298], _6292):-len(_6298, _6310), _6292 is _6310+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(64, solve_goal, [lists, app([1], [2], [1, 2])], proved(app([1], [2], [1, 2]))).
io(65, hash, [lists], 619914534).
io(66, load, [pkg(arith, [(double(_6484, _6486):-_6486 is 2*_6484), (quad(_6484, _6516):-double(_6484, _6486), double(_6486, _6516))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(67, load_tampered, [pkg(arith, [(double(_6618, _6620):-_6620 is 2*_6618), (quad(_6618, _6650):-double(_6618, _6620), double(_6620, _6650))], [quad(3, 12), double(0, 0)], 168790322), 0], refused(hash_mismatch)).
io(68, load_rehashed, [pkg(arith, [(double(_6744, _6746):-_6746 is 2*_6744), (quad(_6744, _6776):-double(_6744, _6746), double(_6746, _6776))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(69, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(70, hash, [false_claim], 250580892).
io(71, load, [pkg(false_claim, [(len([], 0):-true), (len([_6966|_6968], _6962):-len(_6968, _6980), _6962 is _6980+1)], [len([a], 2)], 250580892)], refused(proof_failed(len([a], 2)))).
io(72, load_tampered, [pkg(lists, [(app([], _7074, _7074):-true), (app([_7100|_7102], _7074, [_7100|_7108]):-app(_7102, _7074, _7108))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 1], refused(hash_mismatch)).
io(73, load_rehashed, [pkg(arith, [(double(_7220, _7222):-_7222 is 2*_7220), (quad(_7220, _7252):-double(_7220, _7222), double(_7222, _7252))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(74, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(75, hash, [lists], 619914534).
io(76, load, [pkg(false_claim, [(len([], 0):-true), (len([_7442|_7444], _7438):-len(_7444, _7456), _7438 is _7456+1)], [len([a], 2)], 250580892)], refused(proof_failed(len([a], 2)))).
io(77, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_7572|_7574], _7568):-len(_7574, _7586), _7568 is _7586+1)], [len([a], 2)], 250580892), 0], refused(hash_mismatch)).
io(78, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_7692|_7694], _7688):-len(_7694, _7706), _7688 is _7706+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(79, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(80, hash, [lists], 619914534).
io(81, load, [pkg(lengths, [(len([], 0):-true), (len([_7896|_7898], _7892):-len(_7898, _7910), _7892 is _7910+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(82, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_8036|_8038], _8032):-len(_8038, _8050), _8032 is _8050+1)], [len([a, b, c], 3)], 71780219), 1], refused(hash_mismatch)).
io(83, load_rehashed, [pkg(arith, [(double(_8144, _8146):-_8146 is 2*_8144), (quad(_8144, _8176):-double(_8144, _8146), double(_8146, _8176))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(84, solve_goal, [lists, app([1], [2], [1, 2])], proved(app([1], [2], [1, 2]))).
io(85, hash, [lists], 619914534).
io(86, load, [pkg(arith, [(double(_8350, _8352):-_8352 is 2*_8350), (quad(_8350, _8382):-double(_8350, _8352), double(_8352, _8382))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(87, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_8508|_8510], _8504):-len(_8510, _8522), _8504 is _8522+1)], [len([a, b, c], 3)], 71780219), 0], refused(hash_mismatch)).
io(88, load_rehashed, [pkg(false_claim, [(len([], 0):-true), (len([_8640|_8642], _8636):-len(_8642, _8654), _8636 is _8654+1)], [len([a], 2)], 250580892)], refused(hash_mismatch)).
io(89, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(90, hash, [false_claim], 250580892).
io(91, load, [pkg(lists, [(app([], _8836, _8836):-true), (app([_8862|_8864], _8836, [_8862|_8870]):-app(_8864, _8836, _8870))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], loaded(lists, 2)).
io(92, load_tampered, [pkg(lists, [(app([], _8992, _8992):-true), (app([_9018|_9020], _8992, [_9018|_9026]):-app(_9020, _8992, _9026))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 0], refused(hash_mismatch)).
io(93, load_rehashed, [pkg(lists, [(app([], _9140, _9140):-true), (app([_9166|_9168], _9140, [_9166|_9174]):-app(_9168, _9140, _9174))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(94, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(95, hash, [false_claim], 250580892).
io(96, load, [pkg(false_claim, [(len([], 0):-true), (len([_9408|_9410], _9404):-len(_9410, _9422), _9404 is _9422+1)], [len([a], 2)], 250580892)], refused(proof_failed(len([a], 2)))).
io(97, load_tampered, [pkg(lists, [(app([], _9516, _9516):-true), (app([_9542|_9544], _9516, [_9542|_9550]):-app(_9544, _9516, _9550))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 1], refused(hash_mismatch)).
io(98, load_rehashed, [pkg(lists, [(app([], _9664, _9664):-true), (app([_9690|_9692], _9664, [_9690|_9698]):-app(_9692, _9664, _9698))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(99, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(100, hash, [lists], 619914534).
io(101, load, [pkg(arith, [(double(_9908, _9910):-_9910 is 2*_9908), (quad(_9908, _9940):-double(_9908, _9910), double(_9910, _9940))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(102, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_10066|_10068], _10062):-len(_10068, _10080), _10062 is _10080+1)], [len([a, b, c], 3)], 71780219), 1], refused(hash_mismatch)).
io(103, load_rehashed, [pkg(lists, [(app([], _10176, _10176):-true), (app([_10202|_10204], _10176, [_10202|_10210]):-app(_10204, _10176, _10210))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(104, solve_goal, [arith, double(4, 9)], not_proved).
io(105, hash, [lengths], 71780219).
io(106, load, [pkg(false_claim, [(len([], 0):-true), (len([_10402|_10404], _10398):-len(_10404, _10416), _10398 is _10416+1)], [len([a], 2)], 250580892)], refused(proof_failed(len([a], 2)))).
io(107, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_10532|_10534], _10528):-len(_10534, _10546), _10528 is _10546+1)], [len([a], 2)], 250580892), 0], refused(hash_mismatch)).
io(108, load_rehashed, [pkg(lists, [(app([], _10630, _10630):-true), (app([_10656|_10658], _10630, [_10656|_10664]):-app(_10658, _10630, _10664))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(109, solve_goal, [arith, quad(5, 20)], proved(quad(5, 20))).
io(110, hash, [lengths], 71780219).
io(111, load, [pkg(lists, [(app([], _10838, _10838):-true), (app([_10864|_10866], _10838, [_10864|_10872]):-app(_10866, _10838, _10872))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], loaded(lists, 2)).
io(112, load_tampered, [pkg(lists, [(app([], _10994, _10994):-true), (app([_11020|_11022], _10994, [_11020|_11028]):-app(_11022, _10994, _11028))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 1], refused(hash_mismatch)).
io(113, load_rehashed, [pkg(arith, [(double(_11140, _11142):-_11142 is 2*_11140), (quad(_11140, _11172):-double(_11140, _11142), double(_11142, _11172))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(114, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(115, hash, [arith], 168790322).
io(116, load, [pkg(false_claim, [(len([], 0):-true), (len([_11362|_11364], _11358):-len(_11364, _11376), _11358 is _11376+1)], [len([a], 2)], 250580892)], refused(proof_failed(len([a], 2)))).
io(117, load_tampered, [pkg(lists, [(app([], _11470, _11470):-true), (app([_11496|_11498], _11470, [_11496|_11504]):-app(_11498, _11470, _11504))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 0], refused(hash_mismatch)).
io(118, load_rehashed, [pkg(lists, [(app([], _11618, _11618):-true), (app([_11644|_11646], _11618, [_11644|_11652]):-app(_11646, _11618, _11652))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(119, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(120, hash, [lengths], 71780219).
io(121, load, [pkg(lengths, [(len([], 0):-true), (len([_11860|_11862], _11856):-len(_11862, _11874), _11856 is _11874+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(122, load_tampered, [pkg(arith, [(double(_11976, _11978):-_11978 is 2*_11976), (quad(_11976, _12008):-double(_11976, _11978), double(_11978, _12008))], [quad(3, 12), double(0, 0)], 168790322), 0], refused(hash_mismatch)).
io(123, load_rehashed, [pkg(arith, [(double(_12102, _12104):-_12104 is 2*_12102), (quad(_12102, _12134):-double(_12102, _12104), double(_12104, _12134))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(124, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(125, hash, [false_claim], 250580892).
io(126, load, [pkg(lists, [(app([], _12302, _12302):-true), (app([_12328|_12330], _12302, [_12328|_12336]):-app(_12330, _12302, _12336))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], loaded(lists, 2)).
io(127, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_12480|_12482], _12476):-len(_12482, _12494), _12476 is _12494+1)], [len([a], 2)], 250580892), 0], refused(hash_mismatch)).
io(128, load_rehashed, [pkg(lists, [(app([], _12578, _12578):-true), (app([_12604|_12606], _12578, [_12604|_12612]):-app(_12606, _12578, _12612))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(129, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(130, hash, [lists], 619914534).
io(131, load, [pkg(false_claim, [(len([], 0):-true), (len([_12846|_12848], _12842):-len(_12848, _12860), _12842 is _12860+1)], [len([a], 2)], 250580892)], refused(proof_failed(len([a], 2)))).
io(132, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_12976|_12978], _12972):-len(_12978, _12990), _12972 is _12990+1)], [len([a, b, c], 3)], 71780219), 1], refused(hash_mismatch)).
io(133, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_13108|_13110], _13104):-len(_13110, _13122), _13104 is _13122+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(134, solve_goal, [lists, app([1], [2], [1, 2])], proved(app([1], [2], [1, 2]))).
io(135, hash, [lengths], 71780219).
io(136, load, [pkg(lengths, [(len([], 0):-true), (len([_13320|_13322], _13316):-len(_13322, _13334), _13316 is _13334+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(137, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_13460|_13462], _13456):-len(_13462, _13474), _13456 is _13474+1)], [len([a], 2)], 250580892), 0], refused(hash_mismatch)).
io(138, load_rehashed, [pkg(false_claim, [(len([], 0):-true), (len([_13580|_13582], _13576):-len(_13582, _13594), _13576 is _13594+1)], [len([a], 2)], 250580892)], refused(hash_mismatch)).
io(139, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(140, hash, [lists], 619914534).
io(141, load, [pkg(false_claim, [(len([], 0):-true), (len([_13772|_13774], _13768):-len(_13774, _13786), _13768 is _13786+1)], [len([a], 2)], 250580892)], refused(proof_failed(len([a], 2)))).
io(142, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_13902|_13904], _13898):-len(_13904, _13916), _13898 is _13916+1)], [len([a], 2)], 250580892), 0], refused(hash_mismatch)).
io(143, load_rehashed, [pkg(arith, [(double(_13998, _14000):-_14000 is 2*_13998), (quad(_13998, _14030):-double(_13998, _14000), double(_14000, _14030))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(144, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(145, hash, [lists], 619914534).
io(146, load, [pkg(lists, [(app([], _14224, _14224):-true), (app([_14250|_14252], _14224, [_14250|_14258]):-app(_14252, _14224, _14258))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], loaded(lists, 2)).
io(147, load_tampered, [pkg(arith, [(double(_14378, _14380):-_14380 is 2*_14378), (quad(_14378, _14410):-double(_14378, _14380), double(_14380, _14410))], [quad(3, 12), double(0, 0)], 168790322), 0], refused(hash_mismatch)).
io(148, load_rehashed, [pkg(false_claim, [(len([], 0):-true), (len([_14528|_14530], _14524):-len(_14530, _14542), _14524 is _14542+1)], [len([a], 2)], 250580892)], refused(hash_mismatch)).
io(149, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(150, hash, [lengths], 71780219).
io(151, load, [pkg(arith, [(double(_14696, _14698):-_14698 is 2*_14696), (quad(_14696, _14728):-double(_14696, _14698), double(_14698, _14728))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(152, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_14854|_14856], _14850):-len(_14856, _14868), _14850 is _14868+1)], [len([a], 2)], 250580892), 1], refused(hash_mismatch)).
io(153, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_14974|_14976], _14970):-len(_14976, _14988), _14970 is _14988+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(154, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(155, hash, [lengths], 71780219).
io(156, load, [pkg(lists, [(app([], _15182, _15182):-true), (app([_15208|_15210], _15182, [_15208|_15216]):-app(_15210, _15182, _15216))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], loaded(lists, 2)).
io(157, load_tampered, [pkg(arith, [(double(_15336, _15338):-_15338 is 2*_15336), (quad(_15336, _15368):-double(_15336, _15338), double(_15338, _15368))], [quad(3, 12), double(0, 0)], 168790322), 1], refused(hash_mismatch)).
io(158, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_15486|_15488], _15482):-len(_15488, _15500), _15482 is _15500+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(159, solve_goal, [arith, double(4, 9)], not_proved).
io(160, hash, [arith], 168790322).
io(161, load, [pkg(lengths, [(len([], 0):-true), (len([_15674|_15676], _15670):-len(_15676, _15688), _15670 is _15688+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(162, load_tampered, [pkg(lists, [(app([], _15792, _15792):-true), (app([_15818|_15820], _15792, [_15818|_15826]):-app(_15820, _15792, _15826))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 0], refused(hash_mismatch)).
io(163, load_rehashed, [pkg(lists, [(app([], _15940, _15940):-true), (app([_15966|_15968], _15940, [_15966|_15974]):-app(_15968, _15940, _15974))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(164, solve_goal, [arith, quad(5, 20)], proved(quad(5, 20))).
io(165, hash, [false_claim], 250580892).
io(166, load, [pkg(lists, [(app([], _16148, _16148):-true), (app([_16174|_16176], _16148, [_16174|_16182]):-app(_16176, _16148, _16182))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], loaded(lists, 2)).
io(167, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_16326|_16328], _16322):-len(_16328, _16340), _16322 is _16340+1)], [len([a], 2)], 250580892), 0], refused(hash_mismatch)).
io(168, load_rehashed, [pkg(arith, [(double(_16422, _16424):-_16424 is 2*_16422), (quad(_16422, _16454):-double(_16422, _16424), double(_16424, _16454))], [quad(3, 12), double(0, 0)], 168790322)], refused(hash_mismatch)).
io(169, solve_goal, [lists, app([1], [2], [1, 2])], proved(app([1], [2], [1, 2]))).
io(170, hash, [lengths], 71780219).
io(171, load, [pkg(lengths, [(len([], 0):-true), (len([_16652|_16654], _16648):-len(_16654, _16666), _16648 is _16666+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(172, load_tampered, [pkg(lists, [(app([], _16770, _16770):-true), (app([_16796|_16798], _16770, [_16796|_16804]):-app(_16798, _16770, _16804))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 1], refused(hash_mismatch)).
io(173, load_rehashed, [pkg(lists, [(app([], _16918, _16918):-true), (app([_16944|_16946], _16918, [_16944|_16952]):-app(_16946, _16918, _16952))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(174, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(175, hash, [arith], 168790322).
io(176, load, [pkg(arith, [(double(_17162, _17164):-_17164 is 2*_17162), (quad(_17162, _17194):-double(_17162, _17164), double(_17164, _17194))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(177, load_tampered, [pkg(lengths, [(len([], 0):-true), (len([_17320|_17322], _17316):-len(_17322, _17334), _17316 is _17334+1)], [len([a, b, c], 3)], 71780219), 1], refused(hash_mismatch)).
io(178, load_rehashed, [pkg(false_claim, [(len([], 0):-true), (len([_17452|_17454], _17448):-len(_17454, _17466), _17448 is _17466+1)], [len([a], 2)], 250580892)], refused(hash_mismatch)).
io(179, solve_goal, [arith, quad(5, 20)], proved(quad(5, 20))).
io(180, hash, [lists], 619914534).
io(181, load, [pkg(arith, [(double(_17608, _17610):-_17610 is 2*_17608), (quad(_17608, _17640):-double(_17608, _17610), double(_17610, _17640))], [quad(3, 12), double(0, 0)], 168790322)], loaded(arith, 2)).
io(182, load_tampered, [pkg(lists, [(app([], _17744, _17744):-true), (app([_17770|_17772], _17744, [_17770|_17778]):-app(_17772, _17744, _17778))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 0], refused(hash_mismatch)).
io(183, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_17914|_17916], _17910):-len(_17916, _17928), _17910 is _17928+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(184, solve_goal, [arith, double(4, 9)], not_proved).
io(185, hash, [lengths], 71780219).
io(186, load, [pkg(lengths, [(len([], 0):-true), (len([_18102|_18104], _18098):-len(_18104, _18116), _18098 is _18116+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(187, load_tampered, [pkg(lists, [(app([], _18220, _18220):-true), (app([_18246|_18248], _18220, [_18246|_18254]):-app(_18248, _18220, _18254))], [app([1], [2], [1, 2]), app([], [], [])], 619914534), 0], refused(hash_mismatch)).
io(188, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_18390|_18392], _18386):-len(_18392, _18404), _18386 is _18404+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(189, solve_goal, [lengths, len([x, y], 2)], proved(len([x, y], 2))).
io(190, hash, [arith], 168790322).
io(191, load, [pkg(lengths, [(len([], 0):-true), (len([_18594|_18596], _18590):-len(_18596, _18608), _18590 is _18608+1)], [len([a, b, c], 3)], 71780219)], loaded(lengths, 1)).
io(192, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_18982|_18984], _18978):-len(_18984, _18996), _18978 is _18996+1)], [len([a], 2)], 250580892), 0], refused(hash_mismatch)).
io(193, load_rehashed, [pkg(lengths, [(len([], 0):-true), (len([_28100|_28102], _28096):-len(_28102, _28114), _28096 is _28114+1)], [len([a, b, c], 3)], 71780219)], refused(hash_mismatch)).
io(194, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(195, hash, [lengths], 71780219).
io(196, load, [pkg(lists, [(app([], _47790, _47790):-true), (app([_47816|_47818], _47790, [_47816|_47824]):-app(_47818, _47790, _47824))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], loaded(lists, 2)).
io(197, load_tampered, [pkg(false_claim, [(len([], 0):-true), (len([_59820|_59822], _59816):-len(_59822, _59834), _59816 is _59834+1)], [len([a], 2)], 250580892), 0], refused(hash_mismatch)).
io(198, load_rehashed, [pkg(lists, [(app([], _68916, _68916):-true), (app([_68942|_68944], _68916, [_68942|_68950]):-app(_68944, _68916, _68950))], [app([1], [2], [1, 2]), app([], [], [])], 619914534)], refused(hash_mismatch)).
io(199, solve_goal, [lists, app([1, 2], [3], [1, 2, 3])], proved(app([1, 2], [3], [1, 2, 3]))).
io(200, hash, [false_claim], 250580892).
