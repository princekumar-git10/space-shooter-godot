extends Node

var enemy_scene = preload("res://enemy.tscn")

func _ready():
	get_parent().get_node("boundary").area_entered.connect(_the_end)
	var timer = Timer.new()
	add_child(timer)

	timer.wait_time = 1.5
	timer.one_shot = false
	timer.timeout.connect(_create_enemy)
	timer.start()

func _create_enemy():
	print("Spawning enemy")
	var enemy = enemy_scene.instantiate()
	get_parent().get_node("enemies").add_child(enemy)

func _the_end(body:Node):
	if body is enemy:
		get_tree().set_pause(true)
