extends Node
var enemy = preload("res://enemy1.tscn")
var enemylevel2 = preload("res://enemylevel2.tscn")
var enemylevel3=preload("res://enemy_of_different_level/enemy_level_3_source_code_files_and_shene_files/Enemy_level_3.tscn")
var playerhealth:float =100.0
var score:int

signal playerzero
signal gamestart

onready var enemy_level3_spawn_timer:Timer=$enemylevel3time
func _ready() -> void:
	randomize()
	enemy_level3_spawn_timer.connect("timeout",self,"_on_enemy_level3_spawntimer_timeout")
	#enemy_level3_spawn_timer.start()

func _on_enemyspawntime_timeout():
	var enemyInstance:Area2D = enemy.instance()
	var enemy_spawn_location:PathFollow2D = $Path2D/PathFollow2D
	enemyInstance.position =enemy_spawn_location.position
	enemy_spawn_location.unit_offset = randf()
	enemyInstance.connect("healthzero",self,"scoremeter1")
	get_tree().get_root().add_child(enemyInstance)




func _on_player1_area_entered(_area:Area):
	playerhealth =playerhealth-34
	$Hud/HealthLabel.text= str(playerhealth)
	if(playerhealth <=0):
		emit_signal("playerzero")
		$Hud/startButton.visible = true
		$Hud/HealthLabel.text = str(100)
		$enemyspawntime.stop()
		$enemylevel2time.stop()
		$ScoreTimer.stop()
		$player1/CollisionShape2D.set_deferred("disabled",true)


func _on_Hud_gamestart():
	$enemyspawntime.start()
	$enemylevel2time.start()
	enemy_level3_spawn_timer.start()
	$ScoreTimer.start()
	emit_signal("gamestart")
	$player1/CollisionShape2D.disabled = false
	playerhealth = 100
	score=0
	$Hud.updatescore(score)
	
	


func _on_enemylevel2time_timeout():
	var enemyInstancelevel2 = enemylevel2.instance()
	var enemy_spawn_location = $Path2D/PathFollow2D
	enemyInstancelevel2.position =enemy_spawn_location.position
	enemy_spawn_location.unit_offset = randf()
	enemyInstancelevel2.connect("healthzero",self,"scoremeter2")
	get_tree().get_root().add_child(enemyInstancelevel2)
func _on_enemy_level3_spawntimer_timeout()->void:
	var enemy_instance_level3:Area2D=enemylevel3.instance()
	var enemy_level_spawn_location:PathFollow2D=$Path2D/PathFollow2D
	enemy_instance_level3.position=enemy_level_spawn_location.position
	enemy_level_spawn_location.unit_offset=randf()
	get_tree().get_root().add_child(enemy_instance_level3)
func scoremeter2():
	score =score+4
	$Hud.updatescore(score)
func scoremeter1()->void:
	score =score +2
	$Hud.updatescore(score)
