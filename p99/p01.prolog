%% P01 (*) Find the last element of a list.
%% Example:
%% ?- my_last(X,[a,b,c,d]).
%% X = d

%% This one is very basic.
%% If the list has only one element, the last is the element.
my_last(X, [X]).
%% Or the last element is the last the of the tail of the list.  Hence
%% the problem has been reduced till the base predicate is unified.
my_last(X, [_|T]) :-
    my_last(X, T).
