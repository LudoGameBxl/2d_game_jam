extends Control


@onready var play = $MarginContainer/VBoxContainer/Play
@onready var credit = $MarginContainer/VBoxContainer/Credit
@onready var quit = $MarginContainer/VBoxContainer/Quit
@export var hoverSound : AudioStream

func _enter_tree():
	SceneManager.removeScene("LevelContainer")

func _ready():
	play.connect("button_down", play_button_down)
	credit.connect("button_down", credit_button_down)
	quit.connect("button_down", quit_button_down)
	

func play_button_down():
	AudioManager.play_sound(hoverSound)
	SceneManager.switchScene("LevelContainer")
	pass
	
func credit_button_down():
	AudioManager.play_sound(hoverSound)
	pass
	
func quit_button_down():
	AudioManager.play_sound(hoverSound)
	SceneManager.quitGame()
	pass
