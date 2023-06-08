extends Area2D
class_name bullet_inheriting_area2d
var bulletspeed:int = -800



# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process(false)
func _physics_process(delta):
	var object =Vector2(0,bulletspeed*delta)
	position += object
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()




func _on_Area2D_area_entered(_area):
	queue_free()


func _on_Area2D_body_entered(_body):
	queue_free()


func _on_VisibilityNotifier2D_viewport_exited():
	queue_free()
