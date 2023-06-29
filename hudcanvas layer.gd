tool
extends CanvasLayer
signal gamestart
func updatescore(score):
	$ScoreLabel.text = str(score)

func _on_startButton_pressed():
	$startButton.visible = false
	emit_signal("gamestart")
