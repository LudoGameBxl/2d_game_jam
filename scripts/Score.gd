extends Control

@onready var team_score_red = $HBoxContainer/TeamScoreRed
@onready var team_score_blue = $HBoxContainer/TeamScoreBlue

var score_red := 0
var score_blue := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.GOAL.connect(goal_team)

func goal_team(team)-> void:
	print(team)

	if team == "red":
		print(str(score_red + 1))
		score_red += 1
		team_score_red.text = str(score_red)
	if team == "blue":
		score_blue += 1
		team_score_blue.text = str(score_blue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
