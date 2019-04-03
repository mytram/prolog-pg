%% P34 (**) Calculate Euler's totient function phi(m).
%% Euler's so-called totient function phi(m) is defined as the
%% number of positive integers r (1 <= r < m) that are coprime to
%% m.

%% Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1.

%% ?- Phi is totient_phi(10).
%% Phi = 4

%% Find out what the value of phi(m) is if m is a prime
%% number. Euler's totient function plays an important role in
%% one of the most widely used public key cryptography methods
%% (RSA). In this exercise you should use the most primitive
%% method to calculate this function (there are smarter ways
%% that we shall discuss later).

:-arithmetic_function(totient_phi/1).
:-arithmetic_function(increase_phi_count/2).

totient_phi(1, 1).
totient_phi(M, N) :-
    find_totitent_phi(M, 1, N).

find_totitent_phi(M, R, N) :-
    R < M,
    C is increase_phi_count(M, R),
    NR is R + 1,
    find_totitent_phi(M, NR, NN),
    N is C + NN;
    R >= M,
    N is 0.

increase_phi_count(M, R, 1) :- 1 =:= gcd(M, R).
increase_phi_count(M, R, 0) :- 1 =\= gcd(M, R).
