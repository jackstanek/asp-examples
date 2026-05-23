#const dim = 8.
rank(1..dim). file(1..dim).

1 { queen(R, F) : file(F) } 1 :- rank(R).
:- queen(R1, F1), queen(R2, F2), R1 != R2, F1 == F2.
:- queen(R1, F1), queen(R2, F2), R1 > R2, R1 + F1 == R2 + F2.
:- queen(R1, F1), queen(R2, F2), R1 > R2, R1 - F1 == R2 - F2.

#show queen/2.
