%% P07 (**) Flatten a nested list structure.
%% Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

%% Example:
%% ?- my_flatten([a, [b, [c, d], e]], X).
%% X = [a, b, c, d, e]

%% Hint: Use the predefined predicates is_list/1 and append/3

my_flatten([], []).

my_flatten([Head|Tail], Flattened) :-
    is_list(Head),
    my_flatten(Head, FlatHead),
    my_flatten(Tail, FlatTail),
    append(FlatHead, FlatTail, Flattened), !.
%%
my_flatten([Head|Tail], Flattened) :-
    my_flatten(Tail, FlatTail),
    append([Head], FlatTail, Flattened).
