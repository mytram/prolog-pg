%% P05 (*) Reverse a list.

my_reverse(L1, L2) :- my_rev(L1, L2, []).

my_rev([], L2, L2) :- !.
%% The stack is empty
%% The head of the first list is removed and pushed to the beginning
%% of the stack. Effectively, the stack contains the reverse of the
%% first list. When the first list is empty, assign the stack to the
%% second list.
my_rev([X|Xs], L2, Stack) :- my_rev(Xs, L2, [X|Stack]).
