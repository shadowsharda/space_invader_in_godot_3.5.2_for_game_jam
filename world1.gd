extends Node
var enemy = preload("res://enemy1.tscn")
var enemylevel2 = preload("res://enemylevel2.tscn")
signal playerzero
signal gamestart
var playerhealth:float =100.0
var score:int

func _on_enemyspawntime_timeout():
	var enemyInstance = enemy.instance()
	var enemy_spawn_location = $Path2D/PathFollow2D
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
func scoremeter2():
	score =score+4
	$Hud.updatescore(score)
func scoremeter1()->void:
	score =score +2
	$Hud.updatescore(score)
