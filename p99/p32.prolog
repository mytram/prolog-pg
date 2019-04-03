%% P32 (**) Determine the greatest common divisor of two positive integer numbers.
%% Use Euclid's algorithm.
%%     Example:
%%     ?- gcd(36, 63, G).
%%     G = 9

%%     Define gcd as an arithmetic function; so you can use it like this:
%%     ?- G is gcd(36,63).
%%     G = 9

my_gcd(0, Y, Y) :- Y > 0.
my_gcd(X, Y, G) :-
    X > 0,
    Z is Y mod X,
    my_gcd(Z, X, G).

:- arithmetic_function(my_gcd/2).
