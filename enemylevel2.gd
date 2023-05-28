extends Area2D
var bulletspeed:int = 100
var enemyhealth:int =100
signal healthzero
var bullet = preload("res://bullet.tscn")
onready var animplayer:AnimationPlayer= $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
func _physics_process(delta):
	var object =Vector2(0,bulletspeed*delta)
	position += object
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	$Timer.stop()
	queue_free()













func _on_enemy1_area_entered(_area):
	enemyhealth = enemyhealth-100
	if(enemyhealth<=0):
		emit_signal("healthzero")





func _on_enemylevel2_healthzero():
	queue_free()


func _on_Timer_timeout():
	var bullets = bullet.instance()
	bullets.position = position
	bullets.bulletspeed =700
	get_tree().get_root().add_child(bullets)


func _on_VisibilityNotifier2D_viewport_entered(_viewport):
	$Timer.start()
	animplayer.play("enemy_flicker")
	
