moving([], _, _).

moving(Source, Dest, boatOnRight) :-
    Dest = [rabbit],
    print_move(boat, right, left),
    moving(Source, Dest, boatOnLeft).

moving(Source, Dest, boatOnRight) :-
    Source = [rabbit],
    print_move(boat, right, left),
    moving(Source, Dest, boatOnLeft).

moving(Source, Dest, boatOnLeft) :-
    member(Object, Source),
    select(Object, Source, NewSource),
    move(Object, Dest, X, left, right),
    moving(NewSource, X, boatOnRight), !.

moving(Source, Dest, boatOnRight) :-
    member(Object, Dest),
    select(Object, Dest, NewDest),
    move(Object, Source, X, right, left),
    moving(X, NewDest, boatOnLeft), !.

move(rabbit, Dest, NewDest, From, To) :-
    append(Dest, [rabbit], NewDest),
    print_move(rabbit, From, To).

move(carrot, Dest, NewDest, From, To) :-
    Dest = [rabbit],
    NewDest = [rabbit, carrot],
    print_move(carrot, From, To).

move(carrot, Dest, NewDest, From, To) :-
    Dest = [fox],
    NewDest = [fox, carrot],
    print_move(carrot, From, To).

move(fox, Dest, NewDest, From, To) :-
    Dest = [rabbit],
    NewDest = [rabbit, fox],
    print_move(fox, From, To).

move(fox, Dest, NewDest, From, To) :-
    Dest = [carrot],
    NewDest = [carrot, fox],
    print_move(fox, From, To).

print_move(Object, From, To) :-
    format('~w ~w => ~w~n', [Object, From, To]).
