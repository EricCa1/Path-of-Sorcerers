class_name Player extends CharacterBody2D

@export var speed := 460.0
@export var drag_factor := 10.0

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
