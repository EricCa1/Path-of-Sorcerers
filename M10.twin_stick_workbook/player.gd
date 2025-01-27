class_name Player extends CharacterBody2D

@export var speed := 460.0
@export var drag_factor := 10.0
@export var max_health := 5

var health := max_health: set = set_health 

@onready var _health_bar: ProgressBar = $HealthBar
@onready var _collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	_health_bar.max_value = max_health
	_health_bar.value = health
	

func set_health(new_health: int) -> void:
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	_health_bar.value = health
	
	if health ==0:
		die()

func die() -> void:
	queue_free()
	
	
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GODOT_BOTTOM_RIGHT = preload("res://player/godot_bottom_right.png")
const GODOT_RIGHT = preload("res://player/godot_right.png")
const GODOT_UP = preload("res://player/godot_up.png")
const GODOT_UP_RIGHT = preload("res://player/godot_up_right.png")


func _physics_process(delta: float) -> void:
	var move_direction := Input.get_vector("Move_Left", "Move_Right", "Move_up", "Move_down")
	var desired_velocity	 := speed* move_direction
	var steering := desired_velocity - velocity
	velocity += steering * drag_factor * delta
	move_and_slide()
