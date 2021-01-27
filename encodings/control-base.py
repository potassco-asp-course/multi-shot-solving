import clingo

ctl = clingo.Control()

ctl.load("chemistry.lp")
ctl.ground([("base", [])])
ctl.solve(on_model=print)
