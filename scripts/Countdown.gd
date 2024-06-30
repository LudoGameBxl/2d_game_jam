extends Control
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@export var countdownSound : AudioStream

var time_accumulator := 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.


func _process(delta):
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	time_accumulator += delta
	if second > 0 and time_accumulator >= 1.0:
		AudioManager.play_sound(countdownSound)
		time_accumulator -= 1.0


	label.text =  "%01d" % [second]



func _on_timer_timeout() -> void:
	label.visible = false
	pass # Replace with function body.
