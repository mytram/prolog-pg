%% P21 (*) Insert an element at a given position into a list.
%% Example:
%% ?- insert_at(alfa,[a,b,c,d],2,L).
%% L = [a,alfa,b,c,d]

insert_at(Element, List, 1, [Element|List]).
insert_at(Element, [Head|Tail], Pos, [Head|NX]) :-
    Pos > 1,
    NPos is Pos - 1,
    insert_at(Element, Tail, NPos, NX).
