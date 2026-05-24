% Block world planning problem.

block(a). block(b). block(c).
location(B) :- block(B).

% Initial state. A and B are on the table, C is on A.
on(a, table, 0).
on(c, a,     0).
on(b, table, 0).

% Want a stack: (top) A, B, C (table)
goal_on(a, b).
goal_on(b, c).
goal_on(c, table).

% Set up a time horizon (4 steps max)
#const horizon = 4.
step(0..horizon).         % time points 0,1,...,horizon
move_step(1..horizon).    % actions happen "between" states; step t produces state t

% Whether an item is "clear" (nothing on top of it). The table is always "clear"
% since it has room for all the blocks to be on top of it.
clear(X, T) :- location(X), step(T), not on(_, X, T).
clear(X, T) :- location(X), step(T), X == table.

% Select at most one move for each time step. We can rest at a given time step,
% which can produce multiple isomorphic models up to rest moves.
{ move(B, D, T) : block(B), location(D) } 1 :- move_step(T).

% Forbid illegal moves: blocks can't have anything on top of them and can only
% have a single block on them. A block can't move onto itself.
:- move(B, _, T), not clear(B, T - 1).
:- move(_, D, T), not clear(D, T - 1).
:- move(B, D, _), B == D.

% Update rules. Moving a block at time T to some location means that it's now on
% that location. Everything else stays constant.
on(B, D, T) :- move(B, D, T), move_step(T).
on(B, D, T) :- on(B, D, T - 1), not move(B, _, T), move_step(T).

% Forbid all final states (i.e. states at the horizon timestep) which aren't the
% goal state.
:- goal_on(B, D), not on(B, D, horizon).

#show move/3.
