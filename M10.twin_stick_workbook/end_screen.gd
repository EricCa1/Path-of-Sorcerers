extends Control

var _start_time := Time.get_ticks_msec()

@onready var _time_label: Label = %TimeLabel
@onready var _retry_button: Button = %Retry
@onready var _quit_button: Button = %Quit

# Called when the node enters the scene tree for the first time.
func open() -> void:
	visible = true
	_retry_button.pressed.connect(func () -> void:
		get_tree().paused = true
		get_tree().play_again_current_scene()
	)
	_quit_button.pressed.connect(get_tree().quit)
	
	
	

	var end_time := Time.get_ticks_msec()
	var total_time_msec := end_time - _start_time
	var total_time_s := snappedf(total_time_msec / 1000.0, 0.1)
	_time_label.text = "Time: " + str(total_time_s) + "s"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_again_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit
