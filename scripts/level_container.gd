extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventManager.GAME_pause.connect(pauseMenu)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func pauseMenu(p) -> void:
	print(p)
	if p:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1
