extends KinematicBody2D
var bullet = preload("res://bullet.tscn")
var enemy = preload("res://enemy1.tscn")
var speed =100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed*delta,0))
	elif  Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed*delta,0))
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var bulletInstance = bullet.instance()
		bulletInstance.position =Vector2(position.x,position.y -20)
		get_tree().get_root().add_child(bulletInstance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_enemyspawntime_timeout():
	
	var enemyInstance = enemy.instance()
	var enemy_spawn_location = $Path2D/PathFollow2D
	enemyInstance.position =enemy_spawn_location.position
	get_tree().get_root().add_child(enemyInstance)

