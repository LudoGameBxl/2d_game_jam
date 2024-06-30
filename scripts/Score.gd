extends Control

@onready var team_score_red = $HBoxContainer/TeamScoreRed
@onready var team_score_blue = $HBoxContainer/TeamScoreBlue
@onready var label = $HBoxContainer2/Label

@onready var timer_text = $HBoxContainer2/TimerText
@onready var timer = $HBoxContainer2/Timer

var score_red := 0
var score_blue := 0
var timemout := 90
var time := 0
var second := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	EventManager.GOAL.connect(goal_team)

func _process(delta):
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	timer_text.text = "%02d:%02d" % [minute, second]
	
func goal_team(team)-> void:
	if team == "red":
		score_red += 1
		team_score_red.text = str(score_red)
	if team == "blue":
		score_blue += 1
		team_score_blue.text = str(score_blue)


func _on_timer_timeout():
	EventManager.GAME_finished.emit(team_score_red.text ,team_score_blue.text)
