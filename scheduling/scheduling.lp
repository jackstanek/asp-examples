task(a). task(b). task(c). task(d). task(e). task(f).

% Intervals are half-open: [start, end).
start(a, 0).  end(a, 4).
start(b, 1).  end(b, 5).
start(c, 2).  end(c, 6).
start(d, 4).  end(d, 8).
start(e, 5).  end(e, 9).
start(f, 7).  end(f, 10).

% Visualized (each column is one time unit):
%
%   0 1 2 3 4 5 6 7 8 9
%   +-+-+-+-+-+-+-+-+-+-+
% a [. . . .)
% b   [. . . .)
% c     [. . . .)
% d         [. . . .)
% e           [. . . .)
% f               [. .)

machine(m1). machine(m2). machine(m3).

% Running each task on each machine has an associated cost.
% (Different machines have different speeds, energy rates, etc.)
%
%              m1   m2   m3
cost(a, m1, 1). cost(a, m2, 4). cost(a, m3, 2).
cost(b, m1, 3). cost(b, m2, 1). cost(b, m3, 4).
cost(c, m1, 2). cost(c, m2, 3). cost(c, m3, 1).
cost(d, m1, 1). cost(d, m2, 4). cost(d, m3, 2).
cost(e, m1, 3). cost(e, m2, 1). cost(e, m3, 4).
cost(f, m1, 2). cost(f, m2, 3). cost(f, m3, 1).

% Denote two overlapping intervals as such.
overlap(A, B) :- A != B, start(A, SA), end(A, EA), start(B, SB), end(B, EB), SA < EB, SB < EA.

% For each task, choose an assignment to a machine.
1 { assign(T, M) : machine(M) } 1 :- task(T).

% Disallow assignments where two tasks overlap on the same machine.
:- assign(T1, M), assign(T2, M), overlap(T1, T2).
#show assign/2.

% Find the optimal (cheapest) assignment based on cost.
#minimize { C, T : cost(T, M, C), assign(T, M) }.
