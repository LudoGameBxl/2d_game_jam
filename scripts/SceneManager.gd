extends Node
class_name NSceneManager

@export var scenes : Dictionary = {
	"MainGame" : "res://scenes/MainGame.tscn",
	"Menu" : "res://scenes/menu.tscn",
	"MenuPause" : "res://scenes/menuPause.tscn",
	"LevelContainer" : "res://scenes/level_container.tscn",
	"Mouse":"res://scenes/mouse.tscn",
	"MenuGameFinished": "res://scenes/menu_game_finished.tscn"
}

var currentSceneAlias = ""
@onready var mainScene : String = ProjectSettings.get_setting("application/run/main_scene")

func _ready() -> void:
	currentSceneAlias = scenes.find_key(mainScene)
	EventManager.GAME_finished.connect(game_finish)
	
func hasScene(sceneAlias: String)-> bool:
	return get_parent().has_node(sceneAlias)
	
func addScene(sceneAlias: String) -> void: 
	var instance = load(scenes[sceneAlias]).instantiate()
	get_parent().add_child(instance)

func reloadSpecificScene(sceneAlias: String) -> void: 
	removeScene(sceneAlias)
	await get_tree().create_timer(1.0).timeout
	addScene(sceneAlias)
	
func removeScene(sceneAlias : String) -> void:
	if get_parent().get_node(sceneAlias) != null:
		get_parent().get_node(sceneAlias).queue_free()
	
func switchScene(sceneAlias : String) -> void:
	get_tree().change_scene_to_file(scenes[sceneAlias])

func restartScene() -> void:
	get_tree().reload_current_scene()

func quitGame() -> void:
	get_tree().quit()
	
func game_finish(scoreRed : String, scoreBlue : String) -> void:
	addScene("MenuGameFinished")
	print(scoreRed, scoreBlue) 
