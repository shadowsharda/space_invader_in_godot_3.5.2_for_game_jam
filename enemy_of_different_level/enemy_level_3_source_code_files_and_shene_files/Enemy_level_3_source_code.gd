extends Area2D
#static typeing is preferred
#dynamiclly typed code will not be expected
#costom signals
signal healthzero
#loads bullet into the enemy level 3 scene
const bullet_scene_object=preload("res://bullet.tscn")
#bullet object speed
const bulletspeed:int = 100
#enemy moving speed
const enemy_moving_speed:int=80
#enemy level 3 health changing value will change the enemy health
var enemyhealth:int =100

#random_position2d_bullet_spawner
var bullet_spawner_position2d_location_changer:int=60



#storing nodes reference(memory) to the variables
onready var bullet_interval_timer_type_of_node_timer:Timer=$bullet_intervel_timer
onready var bullet_spwan_position_type_of_node_position_2d=$bullet_spwan_position_position2d
onready var visbility_notifier_2d:VisibilityNotifier2D=$VisibilityNotifier2D
onready var area_the_main_body:Area2D=$"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#turns physics process on aka main game loop_on
	set_physics_process(true)
	#turns off other type of game loop which is not needed
	set_process(false)
	#staring the timers node
	bullet_interval_timer_type_of_node_timer.start()
	#connecting the signals 
	bullet_interval_timer_type_of_node_timer.connect("timeout",self,"on_firerate_interval_timer_timeout")
	visbility_notifier_2d.connect("screen_exited",self,"on_visibilty_notifier_screen_exit")
	area_the_main_body.connect("area_entered",self,"_on_Enemy_level_3_area_entered")
	#connecting costom signals
	area_the_main_body.connect("healthzero",self,"health_zero_function")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var object:Vector2 =Vector2(0,enemy_moving_speed*delta)
	position += object
	
	#special_functionallity of the enemy
	bullet_spwan_position_type_of_node_position_2d.global_position.x+=bullet_spawner_position2d_location_changer*delta
	if bullet_spwan_position_type_of_node_position_2d.position.x>=40:
		bullet_spawner_position2d_location_changer=-60
		#nested if else not using buliding in elif statement t keep it simple
	else:
		if bullet_spwan_position_type_of_node_position_2d.position.x<=-40:
			bullet_spawner_position2d_location_changer=60
	
func on_firerate_interval_timer_timeout()->void:
	print("signal_timer_fired")
	var bullets:Area2D = bullet_scene_object.instance()
	#this line just works
	bullets.position = bullet_spwan_position_type_of_node_position_2d.global_position
	
	bullets.bulletspeed =350
	#adds_the_bullet_object_into _game_scene
	get_tree().get_root().add_child(bullets)
func on_visibilty_notifier_screen_exit()->void:
	#delets the enemy if not klled by player if it exits the screen
	print("deleted due to screen_exit")
	queue_free()


func _on_Enemy_level_3_area_entered(_area: Area2D) -> void:
	print("connected")
	enemyhealth=enemyhealth-100
	if enemyhealth<=0:
		emit_signal("healthzero")
func health_zero_function()->void:
	queue_free()
