%% P20 (*) Remove the K'th element from a list.
%% Example:
%% ?- remove_at(X,[a,b,c,d],2,R).
%% X = b
%% R = [a,c,d]

%%  remove_at(X,[a,b,c,d],2,R).

remove_at(X, L, N, R) :-
    Len is N - 1,
    append(Front, [X|T], L),
    length(Front, Len),
    append(Front, T, R).
