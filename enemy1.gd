extends Area2D

var bulletspeed = 100
var enemyhealth =100
var score =0
signal healthzero
signal playerscore


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
	queue_free()










func _on_enemy1_healthzero():
	queue_free()


func _on_enemy1_area_entered(_area):
	enemyhealth = enemyhealth-50
	if(enemyhealth<=0):  
		emit_signal("healthzero")
