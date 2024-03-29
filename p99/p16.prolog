%% P16 (**) Drop every N'th element from a list.
%% Example:
%% ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
%% X = [a,b,d,e,g,h,k]

%% drop([a, b, c, d, e, f, g, h, i, k], 3, X).

drop(L1,N,L2) :- drop(L1,N,L2,N).

% drop(L1,N,L2,K) :- L2 is obtained from L1 by first copying K-1 elements
%    and then dropping an element and, from then on, dropping every
%    N'th element.
%    (list,integer,list,integer) (?,+,?,+)

drop([], _, [], _).
drop([_|Xs], N, Ys, 1) :- drop(Xs, N, Ys, N).
drop([X|Xs], N, [X|Ys], K) :-
    K > 1,
    K1 is K - 1,
    drop(Xs, N, Ys, K1), !.
