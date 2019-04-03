%% P26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
%% In how many ways can a committee of 3 be chosen from a group of 12
%% people? We all know that there are C(12,3) = 220 possibilities
%% (C(N,K) denotes the well-known binomial coefficients). For pure
%% mathematicians, this result may be great. But we want to really
%% generate all the possibilities (via backtracking).

%% Example:
%% ?- combination(3,[a,b,c,d,e,f],L).
%% L = [a,b,c] ;
%% L = [a,b,d] ;
%% L = [a,b,e] ;
%% ...

combination(N, L, L) :- length(L, N), !.

combination(N, [H|T], [H|SL]) :-
    N > 0,
    NN is N - 1,
    combination(NN, T, SL).

combination(N, [_|T], L) :-
    combination(N, T, L).


%% %% This is the answer. Emmm. is it more prologish?
%%
%% combination(0,_,[]).
%% combination(K,L,[X|Xs]) :-
%%     K > 0,
%%     el(X,L,R),
%%     K1 is K-1,
%%     combination(K1,R,Xs).

%% % Find out what the following predicate el/3 exactly does.

%% el(X,[X|L],L).
%% el(X,[_|L],R) :- el(X,L,R).
