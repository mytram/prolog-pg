%% P23 (**) Extract a given number of randomly selected elements from a list.
%% The selected items shall be put into a result list.
%% Example:
%% ?- rnd_select([a,b,c,d,e,f,g,h],3,L).
%% L = [e,d,a]

%%     Hint: Use the built-in random number generator random/2 and the
%%     result of problem P20.

remove_at(X, L, N, R) :-
    Len is N - 1,
    append(Front, [X|T], L),
    length(Front, Len),
    append(Front, T, R).

rnd_select(_, 0, []).
rnd_select([X], N, [X]) :- N > 0.
rnd_select(L, N, [E|Tail]) :-
    N > 0,
    length(L, Len),
    Len > 1,
    random(1, Len, Pos),
    remove_at(E, L, Pos, Remaining),
    NN is N - 1,
    rnd_select(Remaining, NN, Tail).
