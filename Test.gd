extends Node2D

export var myVar := 10

func _ready():
	for i in 10:
		print("Hello world", i)

	if myVar >= 10:
		print("Has big value")
	else:
		print("Has small value")
