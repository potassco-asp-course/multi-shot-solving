import clingo
from clingo import Function

ctl = clingo.Control()

ctl.load("chemistry-external.lp")
ctl.ground([("base", []),("acid",[42])])
ctl.solve(on_model=print)

ctl.assign_external(Function("d", [2,42]), True)

ctl.solve(on_model=print)
