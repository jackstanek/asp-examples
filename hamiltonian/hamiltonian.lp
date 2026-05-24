node(1..6).
edge(1, 2). edge(2, 3). edge(3, 4). edge(4, 5). edge(5, 6).
edge(2, 1). edge(4, 2). edge(1, 5). edge(6, 3). edge(1, 5). edge(6, 4).

1 { ham(S, T) : edge(S, T) } 1 :- node(S).
1 { ham(S, T) : edge(S, T) } 1 :- node(T).

reach(S, T) :- ham(S, T).
reach(S, T) :- reach(S, U), ham(U, T).
:- node(S), node(T), not reach(S, T).

#show ham/2.
