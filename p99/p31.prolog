%% P31 (**) Determine whether a given integer number is prime.
%% Example:
%% ?- is_prime(7).
%% Yes

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
