node(1..7).

% Edges are given in one direction only; symmetry is derived below.
edge(1,2). edge(1,3). edge(1,4). edge(1,5).
edge(2,3). edge(2,4). edge(2,5).
edge(3,4). edge(3,6).
edge(4,6).
edge(5,6).
edge(1,7). edge(6,7).

% Undirected graph (edge relation is symmetric).
edge(X,Y) :- edge(Y,X).

% Visualized:
%
%        5
%       /|\
%      / | \
%     1--+--2
%    /|\ |  |
%   7 | \|  |
%   | 4--3  |
%   |  \ |  |
%   |   \|  |
%   \    6--+
%    \  /
%     \/
%     (6-7 edge)

% A node is either in or out of the clique. Essentially we are quantifying over
% all subsets of nodes.
{ in_clique(N) } 1 :- node(N).

% Two nodes are in the clique if there's an edge between them and they're
% distinct. We encode it as a contrapositive.
:- not edge(X, Y), in_clique(X), in_clique(Y), X != Y.

% Print the max clique by maximizing over the node count. (Sums "1" per node in
the clique.)
#maximize { 1, N  : node(N), in_clique(N) }.


#show in_clique/1.
