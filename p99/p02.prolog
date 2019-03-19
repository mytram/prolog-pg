%% P02 (*) Find the last but one element of a list.
%% (zweitletztes Element, l'avant-dernier élément)

last_but_one_element(X, [X, _]).
last_but_one_element(X, [_|T]) :-
    last_but_one_element(X, T).
