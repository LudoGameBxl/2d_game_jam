extends Node

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if SceneManager.hasScene("MenuPause"):
			SceneManager.removeScene("MenuPause")
		else:
			SceneManager.addScene("MenuPause")
