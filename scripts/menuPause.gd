extends Control

@onready var resume = $MarginContainer/VBoxContainer/Resume
@onready var exit_to_main_menu = $MarginContainer/VBoxContainer/ExitToMainMenu
@onready var restart = $MarginContainer/VBoxContainer/Restart
@export var hoverSound : AudioStream


func _enter_tree() -> void:
	EventManager.GAME_pause.emit(true)

func _exit_tree() -> void:
	EventManager.GAME_pause.emit(false)

func _ready():
	resume.connect("button_down", resume_button_down)
	restart.connect("button_down", restart_button_down)
	exit_to_main_menu.connect("button_down", mainmenu_button_down)
	
func restart_button_down():
	AudioManager.play_sound(hoverSound)
	SceneManager.removeScene("MenuPause")
	SceneManager.reloadSpecificScene("LevelContainer")
	
func resume_button_down():
	AudioManager.play_sound(hoverSound)
	SceneManager.removeScene("MenuPause")
	
func mainmenu_button_down():
	AudioManager.play_sound(hoverSound)
	SceneManager.removeScene("MenuPause")
	SceneManager.switchScene("Menu")
