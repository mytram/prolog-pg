%% P04 (*) Find the number of elements of a list.

my_length(0, []).
my_length(X, [_|T]) :-
    my_length(Y, T),
    X is Y + 1.
