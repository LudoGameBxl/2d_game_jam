extends Control

@onready var resume = $MarginContainer/VBoxContainer/Resume
@onready var exit_to_main_menu = $MarginContainer/VBoxContainer/ExitToMainMenu

func _ready():
	resume.connect("button_down", resume_button_down)
	exit_to_main_menu.connect("button_down", mainmenu_button_down)
	
func resume_button_down():
	print('resume btn')
	SceneManager.removeScene("MenuPause")
	
func mainmenu_button_down():
	pass
