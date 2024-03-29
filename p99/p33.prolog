%% P33 (*) Determine whether two positive integer numbers are coprime.
%% Two numbers are coprime if their greatest common divisor equals 1.
%% Example:
%% ?- coprime(35, 64).
%% Yes

coprime(X, Y) :-
    1 =:= gcd(X, Y).
