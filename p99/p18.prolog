%% P18 (**) Extract a slice from a list.
%% Given two indices, I and K, the slice is the list containing the
%% elements between the I'th and K'th element of the original list
%% (both limits included). Start counting the elements with 1.

%% Example:
%% ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
%% X = [c,d,e,f,g]

slice(L, Start, End, X) :-
    Len is End - Start + 1,
    Len > 0,
    extract(L, Start, Len, X).

extract(L, 1, Len, X) :-
    append(X, _, L),
    length(X, Len).

extract([_|Tail], Start, Len, X) :-
    NStart is Start - 1,
    extract(Tail, NStart, Len, X).
