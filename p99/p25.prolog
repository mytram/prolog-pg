%% P25 (*) Generate a random permutation of the elements of a list.
%% Example:
%% ?- rnd_permu([a,b,c,d,e,f],L.)
%% L = [b,a,d,c,e,f]

%% Hint: Use the solution of problem P23.


rnd_permu(L, X) :-
    length(L, Len),
    rnd_select(L, Len, X).

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
