@tool 
class_name Pickup extends Area2D


@export var item: Item = null 

@onready var _sprite_2d: Sprite2D = %Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_item(item)
	body_entered.connect(func (body: Node2D) -> void:
		if body is Player:
			item.use(body)
			queue_free()
			)

func set_item(value:Item) -> void:
	item = value
	if _sprite_2d != null:
		_sprite_2d.texture = item.texture
