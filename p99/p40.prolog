%% P40 (**) Goldbach's conjecture.
%% Goldbach's conjecture says that every positive even number greater
%% than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is
%% one of the most famous facts in number theory that has not been
%% proved to be correct in the general case. It has been numerically
%% confirmed up to very large numbers (much larger than we can go with
%% our Prolog system). Write a predicate to find the two prime numbers
%% that sum up to a given even integer.

%% Example:
%% ?- goldbach(28, L).
%% L = [5,23]

%% This is copied from the solution.
%% And this is very procedural.

is_prime(P) :-
    P = 2;
    P = 3.

is_prime(P) :-
    integer(P),
    P > 3,
    P mod 2 =\= 0,
    \+ has_factor(P, 3).

has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N,  L2 is L + 2,  has_factor(N, L2).

goldbach(X, [N1, N2]) :-
    between(2, X, N1),
    between(2, X, N2),
    is_prime(N1),
    is_prime(N2),
    N1 < N2,
    X is N1 + N2.
