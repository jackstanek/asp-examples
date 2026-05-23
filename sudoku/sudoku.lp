% Given clues: (row, col, value).
clue(1, 1, 5). clue(1, 2, 3). clue(2, 1, 6). clue(5, 5, 7).

% Define the board.
#const dim = 9.
cell(1..dim, 1..dim).
val(1..dim).

% Generate a sudoku puzzle. Assign a value to each cell.
1 { sudoku(R, C, V) : val(V) } 1 :- cell(R, C).

% Givens are respected.
sudoku(R, C, V) :- clue(R, C, V).

% Each value shows up once in each row, column, box.
:- sudoku(R1, C, V), sudoku(R2, C, V), R1 != R2.
:- sudoku(R, C1, V), sudoku(R, C2, V), C1 != C2.
:- sudoku(R1, C1, V), sudoku(R2, C2, V),
    (R1, C1) != (R2, C2),
    (R1 - 1) / 3 == (R2 - 1) / 3,
    (C1 - 1) / 3 == (C2 - 1) / 3.

#show sudoku/3.
