%% P15 (**) Duplicate the elements of a list a given number of times.
%% Example:
%% ?- dupli([a,b,c],3,X).
%% X = [a,a,a,b,b,b,c,c,c]

%%     What are the results of the goal:
%%     ?- dupli(X,3,Y).

duplicate([], _, []).
duplicate([Head|Tail], Times, X) :-
    duplicate(Tail, Times, SX),
    make_list(Head, Times, List),
    append(List, SX, X).

make_list(_, 0, []).
make_list(E, N, X) :-
    N > 0,
    Next is N - 1,
    make_list(E, Next, SX),
    append([E], SX, X).
