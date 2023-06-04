extends Area2D

const enemy_moving_speed:float=50.0

#store calculated distance
var distance_calculation:float=0

#boss health
var health: int = 100
# var b: String = "text"
var boss_stop_moving:bool=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_physics_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if boss_stop_moving==false:
		var object:Vector2 =Vector2(0,enemy_moving_speed*delta)
		position += object
	
	distance_calculation=distance_calculation+(enemy_moving_speed*delta)
	if distance_calculation>=100:
		boss_stop_moving=true
		
	#print(distance_calculation)
