#include <incmode>.

#program base.

p(0).

#program step (t).

p(t) :- p(t-1).

#program check (t).
#external query(t).

:- not p(42), query(t).
