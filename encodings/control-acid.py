import clingo

ctl = clingo.Control()

ctl.load("chemistry.lp")
ctl.ground([("acid",[42])])
ctl.solve(on_model=print)
