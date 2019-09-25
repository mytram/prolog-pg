%% P97 (**) Sudoku
%%     Sudoku puzzles go like this:
%%
%%        Problem statement                 Solution

%%         .  .  4 | 8  .  . | .  1  7       9  3  4 | 8  2  5 | 6  1  7
%%                 |         |                       |         |
%%         6  7  . | 9  .  . | .  .  .       6  7  2 | 9  1  4 | 8  5  3
%%                 |         |                       |         |
%%         5  .  8 | .  3  . | .  .  4       5  1  8 | 6  3  7 | 9  2  4
%%         --------+---------+--------       --------+---------+--------
%%         3  .  . | 7  4  . | 1  .  .       3  2  5 | 7  4  8 | 1  6  9
%%                 |         |                       |         |
%%         .  6  9 | .  .  . | 7  8  .       4  6  9 | 1  5  3 | 7  8  2
%%                 |         |                       |         |
%%         .  .  1 | .  6  9 | .  .  5       7  8  1 | 2  6  9 | 4  3  5
%%         --------+---------+--------       --------+---------+--------
%%         1  .  . | .  8  . | 3  .  6       1  9  7 | 5  8  2 | 3  4  6
%%                 |         |                       |         |
%%         .  .  . | .  .  6 | .  9  1       8  5  3 | 4  7  6 | 2  9  1
%%                 |         |                       |         |
%%         2  4  . | .  .  1 | 5  .  .       2  4  6 | 3  9  1 | 5  7  8
%%
%%
%% Every spot in the puzzle belongs to a (horizontal) row and a
%% (vertical) column, as well as to one single 3x3 square (which we
%% call "square" for short). At the beginning, some of the spots carry
%% a single-digit number between 1 and 9. The problem is to fill the
%% missing spots with digits in such a way that every number between 1
%% and 9 appears exactly once in each row, in each column, and in each
%% square.

%% spot(Number, Position, Row, Column) :-
%%     between(1, 9, Number),
%%     between(0, 80, Position),
%%     Row is div(Position, 9),
%%     Column is Position - Row * 9.

%% dynamic spot/4.

rows :-
    between(0, 8, R),
    P0 is R * 9 + 0, P1 is R * 9 + 1, P2 is R * 9 + 2,
    P3 is R * 9 + 3, P4 is R * 9 + 4, P5 is R * 9 + 5,
    P6 is R * 9 + 6, P7 is R * 9 + 7, P8 is R * 9 + 8,
    Digits = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    member(X0, Digits), member(X1, Digits), member(X2, Digits),
    member(X3, Digits), member(X4, Digits), member(X5, Digits),
    member(X6, Digits), member(X7, Digits), member(X8, Digits),
    spot(X0, P0, _, _), spot(X1, P1, _, _), spot(X2, P2, _, _),
    spot(X3, P3, _, _), spot(X4, P4, _, _), spot(X5, P5, _, _),
    spot(X6, P6, _, _), spot(X7, P7, _, _), spot(X8, P8, _, _),
    sort([X0, X1, X2, X3, X4, X5, X6, X7, X8], [1, 2, 3, 4, 5, 6, 7, 8, 9]).

columns :-
    between(0, 8, C),
    P0 is R * 0 + C, P1 is R * 1 + C, P2 is R * 2 + C,
    P3 is R * 3 + C, P4 is R * 4 + C, P5 is R * 5 + C,
    P6 is R * 6 + C, P7 is R * 7 + C, P8 is R * 8 + C,
    Digits = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    member(X0, Digits), member(X1, Digits), member(X2, Digits),
    member(X3, Digits), member(X4, Digits), member(X5, Digits),
    member(X6, Digits), member(X7, Digits), member(X8, Digits),
    spot(X0, P0, _, _), spot(X1, P1, _, _), spot(X2, P2, _, _),
    spot(X3, P3, _, _), spot(X4, P4, _, _), spot(X5, P5, _, _),
    spot(X6, P6, _, _), spot(X7, P7, _, _), spot(X8, P8, _, _),
    sort([X0, X1, X2, X3, X4, X5, X6, X7, X8], [1, 2, 3, 4, 5, 6, 7, 8, 9]).

squares :-
    between(0, 3, SR), %% SquareRL
    between(0, 3, SL), %%
    Row0 is SR * 3, Row1 is Row0 + 1, Row2 is Row1 + 1,
    Col0 is SL * 3, Col1 is Col0 + 1, Col2 is Col1 + 1,
    Digits = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    member(X0, Digits), member(X1, Digits), member(X2, Digits),
    member(X3, Digits), member(X4, Digits), member(X5, Digits),
    member(X6, Digits), member(X7, Digits), member(X8, Digits),
    spot(X0, _, Row0, Col0), spot(X1, _, Row0, Col1), spot(X2, _, Row0, Col2),
    spot(X3, _, Row1, Col0), spot(X4, _, Row1, Col1), spot(X5, _, Row1, Col2),
    spot(X6, _, Row2, Col0), spot(X7, _, Row2, Col1), spot(X8, _, Row2, Col2),
    sort([X0, X1, X2, X3, X4, X5, X6, X7, X8], [1, 2, 3, 4, 5, 6, 7, 8, 9]).

assert_sudoku([], _).
assert_sudoku([H|T], N) :-
    Row is div(N, 9),
    Column is N - Row * 9,
    asserta(spot(H, N, Row, Column)),
    NN is N + 1,
    assert_sudoku(T, NN).

sudoku(L) :-
    assert_sudoku(L, 0),
    rows,
    columns,
    squares.

%% column([], _, []).
%% column([Row|Others], N, [E|Rest]) :-
%%     nth0(N, Row, E),
%%     column(Others, N, Rest).

%% row([Row|_], Row).
%% row([_|Tail], Row) :-
%%     row(Tail, Row).

%% column(Matrix, Column) :-
%%     length(Matrix, D),
%%     High is D - 1,
%%     between(0, High, C),
%%     column(Matrix, C, Column).

%% fill_values([]).
%% fill_values([H|T]) :-
%%     member(H, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
%%     fill_values(T).

%% square(Square) :-
%%     flatten(Square, Values),
%%     fill_values(Values),
%%     Digits = [1, 2, 3, 4, 5, 6, 7, 8, 9],
%%     sort(Values, Digits).

%% sudoku(Matrix) :-
%%     extract_square(Matrix, Square),
%%     square(Square),
%%     row(Matrix, Row),
%%     sort(Row, Digits),
%%     column(Matrix, Column),
%%     sort(Column, Digits).

%% spot(R, L, Matrix, E) :-
%%     nth0(R, Matrix, Row),
%%     nth0(L, Row, E).

%% [[E0,  E1,  4,  8,  E2,  E3,  E4,  1,  7],
%%  [6,  7,  E5,  9,  E6,  E7,  E8,  E9,  E10],
%%  [5,  E11,  8,  E12,  3,  E13,  E14,  E15,  4],
%%  [3,  E16,  E17,  7,  4,  E18,  1,  E20,  E21],
%%  [E22,  6,  9,  E23,  E24,  E25,  7,  8,  E26],
%%  [E27,  E28,  1,  E29,  6,  9,  E30,  E31,  5],
%%  [1,  E32,  E33,  E34,  8,  E35,  3,  E36,  6],
%%  [E37,  E38,  E39,  E40,  E41,  6,  E42,  9,  1],
%%  [2,  4,  E43,  E44,  E45,  1,  5,  E46,  E47]].

%% E0,  E1,  4,  8,  E2,  E3,  E4,  1,  7,
%%  6,  7,  E5,  9,  E6,  E7,  E8,  E9,  E10,
%%  5,  E11,  8,  E12,  3,  E13,  E14,  E15,  4,
%%  3,  E16,  E17,  7,  4,  E18,  1,  E20,  E21,
%%  E22,  6,  9,  E23,  E24,  E25,  7,  8,  E26,
%%  E27,  E28,  1,  E29,  6,  9,  E30,  E31,  5,
%%  1,  E32,  E33,  E34,  8,  E35,  3,  E36,  6,
%%  E37,  E38,  E39,  E40,  E41,  6,  E42,  9,  1,
%%  2,  4,  E43,  E44,  E45,  1,  5,  E46,  E47.

%% extract_square(Matrix, [[E00, E01, E02], [E10, E11, E12], [E20, E21, E22]]) :-
%%     between(0, 3, SR), %% SquareRL
%%     between(0, 3, SL), %%
%%     Row0 is SR * 3, Row1 is Row0 + 1, Row2 is Row1 + 1,
%%     Col0 is SL * 3, Col1 is Col0 + 1, Col2 is Col1 + 1,
%%     spot(Row0, Col0, Matrix, E00),
%%     spot(Row0, Col1, Matrix, E01),
%%     spot(Row0, Col2, Matrix, E02),
%%     spot(Row1, Col0, Matrix, E10),
%%     spot(Row1, Col1, Matrix, E11),
%%     spot(Row1, Col2, Matrix, E12),
%%     spot(Row2, Col0, Matrix, E20),
%%     spot(Row2, Col1, Matrix, E21),
%%     spot(Row2, Col2, Matrix, E22).
