%% P19 (**) Rotate a list N places to the left.
%% Examples:
%% ?- rotate([a,b,c,d,e,f,g,h],3,X).
%% X = [d,e,f,g,h,a,b,c]

%%     ?- rotate([a,b,c,d,e,f,g,h],-2,X).
%% X = [g,h,a,b,c,d,e,f]

%%     Hint: Use the predefined predicates length/2 and append/3, as
%%     well as the result of problem P17.

rotate(L, N, X) :-
    N > 0,
    rotate_left(L, N, X);
    N < 0,
    NN is N - N - N,
    rotate_right(L, NN, X).

rotate_left([Head|Tail], 1, X) :-
    append(Tail, [Head], X).

rotate_left(L, N, X) :-
    NN is N - 1,
    rotate_left(L, 1, NX),
    rotate_left(NX, NN, X).

rotate_right(L, 1, [H|T]) :-
    append(T, [H], L).

rotate_right(L, N, X) :-
    NN is N - 1,
    rotate_right(L, 1, NX),
    rotate_right(NX, NN, X).
