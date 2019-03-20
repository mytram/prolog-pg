%% P14 (*) Duplicate the elements of a list.
%% Example:
%% ?- dupli([a,b,c,c,d],X).
%% X = [a,a,b,b,c,c,c,c,d,d]

duplicate([], []).
duplicate([Head|Tail], X) :-
    duplicate(Tail, SX),
    append([Head, Head], SX, X).
