% Demonstrates defeasibility with a toy criminal sentencing/punishment problem.

% We have some case facts --- a few people committed offenses.
person(alice).
person(bob).
person(carol).
person(dave).

committed_offense(alice).
committed_offense(bob).
committed_offense(carol).
committed_offense(dave).

minor(bob).            % Bob was a minor
minor(carol).          % Carol was a minor
serious(carol).        % Carol's offense was serious
immunity(dave).        % Dave has immunity (and also offended)

% Someone can be punished if they committed an offence and there isn't a reason
% we *can't* punish them for it.
punishable(P) :- committed_offense(P),
                 not exception_to_punishment(P),
                 not immune(P).

% Minors in general can't be punished (but, there are exceptions...)
exception_to_punishment(P) :- minor(P),
                              not minor_exception_overridden(P).

% (... such as if they committed a "serious" offence.)
minor_exception_overridden(P) :- minor(P), serious(P).

% If someone is immune, then they can't be punished, period.
immune(P) :- immunity(P).

% Determine which of our offenders may be punished.
#show punishable/1.
