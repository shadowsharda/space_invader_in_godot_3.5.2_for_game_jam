extends Area2D
var bullet = preload("res://bullet.tscn")

export var speed:float = 400.0
var screen_size:Vector2 = Vector2.ZERO

func _ready():
	#set_process(false)
	#set_physics_process(false)
	screen_size  =get_viewport_rect().size

	
func _process(delta):
	var direction =Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		 direction.x += 1
	if Input.is_action_pressed("move_left"):
		 direction.x -= 1

	if Input.is_action_pressed("move_down"):
		 direction.y +=1
	if Input.is_action_pressed("move_up"):
		 direction.y -=1
	if direction.length()>1:
		direction.x = 0
		direction.y	=0
	position += direction * speed * delta
	if Input.is_action_just_pressed("fire"):
		$Timer.start()
		var bulletInstance = bullet.instance()
		bulletInstance.position =Vector2(position.x,position.y)
		bulletInstance.rotation_degrees = rotation_degrees
		get_tree().get_root().add_child(bulletInstance)
	if Input.is_action_just_released("fire"):
		$Timer.stop()
	position.x = clamp(position.x,0,screen_size.x)
	position.y = clamp(position.y,0,screen_size.y)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the fir Replace with function body.





func _on_world1node_playerzero():
	$Sprite.visible = false
	$Timer.stop()
	set_process(false)

func _on_Timer_timeout():
	var bulletInstance = bullet.instance()
	bulletInstance.position =Vector2(position.x ,position.y-20)
	bulletInstance.rotation_degrees = rotation_degrees
	
	get_tree().get_root().add_child(bulletInstance)


func _on_world1node_gamestart():
	$Sprite.visible = true
	set_process(true)
