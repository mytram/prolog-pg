%% P27 (**) Group the elements of a set into disjoint subsets.
%% a) In how many ways can a group of 9 people work in 3 disjoint
%% subgroups of 2, 3 and 4 persons? Write a predicate that generates
%% all the possibilities via backtracking.

%% Example:
%% ?- group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida],G1,G2,G3).
%% G1 = [aldo,beat], G2 = [carla,david,evi], G3 = [flip,gary,hugo,ida]
%% ...

%% b) Generalize the above predicate in a way that we can specify a
%% list of group sizes and the predicate will return a list of groups.

%% Example:
%% ?- group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs).
%% Gs = [[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]]
%% ...

%% Note that we do not want permutations of the group members;
%% i.e. [[aldo,beat],...] is the same solution as
%% [[beat,aldo],...]. However, we make a difference between
%% [[aldo,beat],[carla,david],...] and
%% [[carla,david],[aldo,beat],...].

%% You may find more about this combinatorial problem in a good book
%% on discrete mathematics under the term "multinomial coefficients".

%% b)
group([], _, []).
group(List, [N|Ns], [G|OtherGroups]) :-
    choose(List, N, G, Remain),
    group(Remain, Ns, OtherGroups).

%% a)
group3(List, G2, G3, G4) :-
    choose(List, 2, G2, Remain),
    choose(Remain, 3, G3, G4).

choose(List, N, List, []) :- length(List, L), L is N.

choose(List, N, [Head|SubTail], Remain) :-
    length(List, Len), Len > N,
    List = [Head|Tail],
    NN is N - 1,
    choose(Tail, NN, SubTail, Remain).

choose([Head|Tail], N, Sublist, [Head|Remain]) :-
    length(Tail, Len), Len >= N,
    choose(Tail, N, Sublist, Remain).
