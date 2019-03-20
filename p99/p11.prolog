%% P11 (*) Modified run-length encoding.
%% Modify the result of problem P10 in such a way that if an element
%% has no duplicates it is simply copied into the result list. Only
%% elements with duplicates are transferred as [N,E] terms.

%% Example:
%% ?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%% X = [[4,a],b,[2,c],[2,a],d,[4,e]]

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
    encode_head_element(Element, HeadLen, EncodedTail, X).

encode_head_element(E, Len, Tail, X) :-
    Len = 1,
    append([E], Tail, X);
    Len > 1,
    append([[Len, E]], Tail, X).

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
