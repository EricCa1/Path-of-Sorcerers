class_name Mob extends CharacterBody2D

@export var max_speed := 250.0
@export var accerleration := 700.0

var _player: Player = null

@onready var _detection_area: Area2D = $DetectionArea

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	_detection_area.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			_player = body
)
	_detection_area.body_exited.connect(func (body: Node) -> void:
		if body is Player:
			_player = null
)

func _physics_process(delta: float) -> void:
	if  _player == null:
		velocity = velocity.move_toward(Vector2.ZERO, accerleration * delta)
	else:
		var direction := global_position.direction_to(_player.global_position)
		var distance := global_position.distance_to(_player.global_position)
		var speed := max_speed if distance > 120.0 else max_speed * distance / 120.0
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity, accerleration * delta)

	move_and_slide()


func _on_detection_area_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_detection_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
