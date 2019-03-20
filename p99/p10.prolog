%% P10 (*) Run-length encoding of a list.
%% Use the result of problem P09 to implement the so-called run-length
%% encoding data compression method. Consecutive duplicates of
%% elements are encoded as terms [N,E] where N is the number of
%% duplicates of the element E.

%% Example:
%% ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%% X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]

run :-
    encode([a, a, a, a, b, c, c, a, a, d, e, e, e, e], X),
    print(X).

encode(List, X) :-
    pack(List, Packed),
    encode_packed(Packed, X).

encode_packed([], []).
encode_packed([Head|Tail], X) :-
    nth0(0, Head, Element),
    length(Head, HeadLen),
    encode_packed(Tail, EncodedTail),
    append([[HeadLen, Element]], EncodedTail, X).

pack([], []).
pack([Head|Tail], X) :-
    pack(Tail, PT),
    pack_head(Head, PT, X).

pack_head(Head, [], [[Head]]).
pack_head(Head, [SH|ST], X) :-
    nth0(0, SH, Head),
    append([Head], SH, NH),
    append([NH], ST, X), !;
    append([[Head], SH], ST, X).
