%% P24 (*) Lotto: Draw N different random numbers from the set 1..M.
%% The selected numbers shall be put into a result list.
%% Example:
%% ?- rnd_select(6,49,L).
%% L = [23,1,17,33,21,37]

%%     Hint: Combine the solutions of problems P22 and P23.

rnd_select(0, _, []).
rnd_select(N, M, [X|T]) :-
    N > 0,
    NN is N - 1,
    random(1, M, X),
    rnd_select(NN, M, T).
