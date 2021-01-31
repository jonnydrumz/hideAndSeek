extends Node

func busted(ghost):
	ghost.death()

func step_found(step):
	step.show()
