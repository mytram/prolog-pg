%% P22 (*) Create a list containing all integers within a given range.
%% Example:
%% ?- range(4,9,L).
%% L = [4,5,6,7,8,9]

range(X, X, [X]).
range(Begin, End, [Begin|Next]) :-
    NewBegin is Begin + 1,
    Begin < End,
    range(NewBegin, End, Next).
