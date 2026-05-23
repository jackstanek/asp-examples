node(1..4).
edge(1, 2). edge(2, 3). edge(3, 4). edge(4, 1). edge(1, 3).

{ color(X, C) : C = (r; g; b) } = 1 :- node(X).

:- edge(X, Y), color(X, C), color(Y, C).

#show color/2.
