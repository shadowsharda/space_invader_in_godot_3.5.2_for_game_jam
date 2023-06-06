extends Area2D
#value can be changed from editor not avilable as export variable to save pc memory
const enemy_moving_speed:float=50.0
const boss_must_travelled_before_starting_sideways_movement:int=150

#store calculated distance
var distance_calculation:float=0



#boss health
var health: int = 100
# var b: String = "text"
var boss_stop_moving:bool=false
var boss_start_moving_sideways:bool=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#starting the game loop _physics_process 
	set_physics_process(true)
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if boss_stop_moving==false:
		var object:Vector2 =Vector2(0,enemy_moving_speed*delta)
		position += object
	
	distance_calculation=distance_calculation+(enemy_moving_speed*delta)
	if distance_calculation>=boss_must_travelled_before_starting_sideways_movement:
		boss_stop_moving=true
		
	#print(distance_calculation)
