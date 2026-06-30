extends Node2D


var bullet_scene=preload("res://entities/bullet/bullet.tscn")
var direction:int=0
var speed:int=300
var player_half_width:int=24

var shoot_time:=1.0
var shoot_counter=0

func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	shoot_counter += delta
	if Input.is_action_pressed("shoot") and shoot_counter>shoot_time:
		shoot_counter=0
		
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position.x=position.x
		bullet_instance.position.y=position.y-20
		get_parent().get_node("bullets").add_child(bullet_instance)
		
	if Input.is_action_pressed("left"):
		direction=-1
	elif Input.is_action_pressed("right"):
		direction=1
	else :
		direction=0

	position.x=clamp(position.x+direction*speed*delta,player_half_width,400-player_half_width)
	
