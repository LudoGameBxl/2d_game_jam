extends Node
class_name NSceneManager

@export var scenes : Dictionary = {
	"MainGame" : "res://scenes/MainGame.tscn",
	"Menu" : "res://scenes/menu.tscn",
	"MenuPause" : "res://scenes/menuPause.tscn",
	"LevelContainer" : "res://scenes/level_container.tscn",
}

var currentSceneAlias = ""
@onready var mainScene : String = ProjectSettings.get_setting("application/run/main_scene")

func _ready() -> void:
	currentSceneAlias = scenes.find_key(mainScene)
	#addScene("Menu")

#func AddScene(sceneAlias : String, scenePath : String) -> void:
	#scenes[sceneAlias] = scenePath
	
func togglePauseScene(sceneAlias : String) -> void:
	print(sceneAlias)
	print(get_parent().get_node(sceneAlias))
	get_tree().pause = true

func hasScene(sceneAlias: String)-> bool:
	return get_parent().has_node(sceneAlias)

	
func addScene(sceneAlias: String) -> void: 
	var instance = load(scenes[sceneAlias]).instantiate()
	get_parent().add_child(instance)
	
func removeScene(sceneAlias : String) -> void:
	get_parent().get_node(sceneAlias).queue_free()
	
func switchScene(sceneAlias : String) -> void:
	get_tree().change_scene_to_file(scenes[sceneAlias])

func restartScene() -> void:
	get_tree().reload_current_scene()
	
func quitGame() -> void:
	get_tree().quit()
