extends Area2D
#value can be changed from editor not avilable as export variable to save pc memory
const enemy_moving_speed:float=50.0
const boss_must_travelled_before_starting_sideways_movement:int=150
#boss health
var health: int = 100
#store calculated distance
var distance_calculation:float=0.0
var side_ways_distance_calculation:float=0.0

var plus_to_minus_changer:int=1


# var b: String = "text"
var boss_stop_moving:bool=false
var boss_start_moving_sideways:bool=false
#loading_boss_level_1_special_bullet
const boss_level_1_bullet=preload("res://enemy_of_different_level/level1_boss_ship/boss_level_1_special_bullet/boss_level_1_special_bullet.tscn")
onready var firerateTimer:Timer=$firerateTimer

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
		#activating side way_movement
		boss_start_moving_sideways=true
	if boss_start_moving_sideways==true:
		distance_calculation=0

		var boss_moving_side_ways_in_x_axis:Vector2=Vector2(enemy_moving_speed*delta*plus_to_minus_changer,0)
		#can also write position=position+boss_moving_side_ways_in_x_axis
		#writting like this so that people can easily understand
		self.position=self.position+boss_moving_side_ways_in_x_axis
		side_ways_distance_calculation+=(enemy_moving_speed*delta*plus_to_minus_changer)
		if side_ways_distance_calculation>=boss_must_travelled_before_starting_sideways_movement:
			#self.position=self.position+(boss_moving_side_ways_in_x_axis*-1)
			plus_to_minus_changer=-1
		if side_ways_distance_calculation<=-100:
			plus_to_minus_changer=1
		print(distance_calculation)
		print(side_ways_distance_calculation)
