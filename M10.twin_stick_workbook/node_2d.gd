extends Node2D

@onready var _teleporter: Area2D = %Teleporter
@onready var _end_screen: Control = $CanvasLayer/EndScreen


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	# _teleporter.body_entered.connect(func (body: Node) -> void:
		#if body is Player:
			#_end_screen.open()
	#)
	
	
	
func _process(delta: float) -> void:
	pass


func _on_teleporter_body_entered(body: Node2D) -> void:
	if body is Player:
		_end_screen.visible = true
		get_tree().paused = false
