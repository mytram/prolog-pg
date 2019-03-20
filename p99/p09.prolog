%% P09 (**) Pack consecutive duplicates of list elements into sublists.
%% If a list contains repeated elements they should be placed in separate sublists.

%% Example:
%% ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%%

run :-
    pack([a, a, a, a, b, c, c, a, a, d, e, e, e, e], X),
    print(X).

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
