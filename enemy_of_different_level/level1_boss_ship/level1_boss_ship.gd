extends Area2D

const enemy_moving_speed:float=50.0
var distance_calculation:float=0

var health: int = 100
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_physics_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var object:Vector2 =Vector2(0,enemy_moving_speed*delta)
	position += object
