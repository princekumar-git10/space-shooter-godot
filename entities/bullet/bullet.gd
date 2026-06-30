extends Node2D

var bullet_speed=200

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	position.y-=bullet_speed*delta
	
	if position.y<0:
		queue_free()
