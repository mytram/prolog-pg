%% P17 (*) Split a list into two parts; the length of the first part is given.
%% Do not use any predefined predicates.

%% Example:
%% ?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
%% L1 = [a,b,c]
%%      L2 = [d,e,f,g,h,i,k]

%% The problem is to find a L1 whose length is the same as N, and L1 +
%% L2 is L. Funny. This is exactly what split means.
split(L, N, L1, L2) :-
    append(L1, L2, L),
    length(L1, N).

%% The answer from the question. Amazingly, mine is even shorter and
%% cleaner in MHO, while I rely on built-in predicates, append/3 and
%% length/2

%% split(L,0,[],L).
%% split([X|Xs],N,[X|Ys],Zs) :- N > 0, N1 is N - 1, split(Xs,N1,Ys,Zs).
