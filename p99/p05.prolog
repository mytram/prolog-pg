%% P05 (*) Reverse a list.

reverse_list([], []).
reverse_list([Head|Tail], Reversed) :-
    reverse_list(Tail, ReversedTail),
    append_list(ReversedTail, [Head], Reversed).

append_list([], List, List).
append_list([Head|Tail], List, NewList) :-
    NewList = [Head|SubList],
    append_list(Tail, List, SubList).
