peg(a;b;c).           disk(1..7).

init_on(1,a).         goal_on((3;4),a).
init_on((2;7),b).     
init_on((3;4;5;6),c). goal_on((1;2;5;6;7),c).

#program base.
on(D,P,0)   :- init_on(D,P).

#program step(t).

{ move(D,P,t) : disk(D), peg(P) } = 1.

moved(D,t) :- move(D,_,t).
blocked(D,P,t) :- on(D+1,P,t-1), disk(D).
blocked(D,P,t) :- blocked(D+1,P,t), disk(D).
:- move(D,P,t), blocked(D-1,P,t).
:- moved(D,t), on(D,P,t-1), blocked(D,P,t).

on(D,P,t) :- on(D,P,t-1), not moved(D,t).
on(D,P,t) :- move(D,P,t).
:- { on(D,P,t) } != 1, disk(D).

#show move/3.

#program check(t).
#external query(t).

:- goal_on(D,P), not on(D,P,t), query(t).
