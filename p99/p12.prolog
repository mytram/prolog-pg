%% P12 (**) Decode a run-length encoded list.
%% Given a run-length code list generated as specified in problem
%% P11. Construct its uncompressed version.

run(X) :-
    decode(X, Y),
    print(Y).

decode([], []).
decode([Head|Tail], X) :-
    Head = [Len, Element],
    make_list(Element, Len, List),
    decode(Tail, DecodedTail),
    append([List], DecodedTail, X),!;
    decode(Tail, DecodedTail),
    append([Head], DecodedTail, X).

make_list(_, 0, []).
make_list(E, N, X) :-
    N > 0,
    Next is N - 1,
    make_list(E, Next, SL),
    [E|SL] = X.
