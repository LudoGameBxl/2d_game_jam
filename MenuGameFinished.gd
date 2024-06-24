extends Control

@onready var score = $MarginContainer/VBoxContainer/Score
@onready var restart: Button = $MarginContainer/VBoxContainer/Restart
@onready var exit_to_main_menu: Button = $MarginContainer/VBoxContainer/ExitToMainMenu

func _enter_tree() -> void:
	EventManager.GAME_pause.emit(true)

func _exit_tree() -> void:
	EventManager.GAME_pause.emit(false)

func _ready() -> void:
	restart.connect("button_down", restart_button_down)
	exit_to_main_menu.connect("button_down", mainmenu_button_down)
	
func restart_button_down():
	SceneManager.removeScene("MenuGameFinished")
	SceneManager.reloadSpecificScene("LevelContainer")
	
func mainmenu_button_down():
	SceneManager.removeScene("MenuGameFinished")
	SceneManager.switchScene("Menu")
