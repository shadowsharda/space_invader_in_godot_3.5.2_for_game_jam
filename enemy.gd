extends RigidBody2D
var bulletspeed = 500
signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
func _physics_process(delta):
	var speed=(Vector2(0,bulletspeed* delta))
	linear_velocity =speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_enemy_body_entered(body):
	queue_free()
