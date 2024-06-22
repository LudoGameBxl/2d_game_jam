extends Node

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if SceneManager.hasScene("MenuPause"):
			SceneManager.removeScene("MenuPause")
			SceneManager.togglePauseScene("LevelContainer")
		else:
			SceneManager.addScene("MenuPause")
