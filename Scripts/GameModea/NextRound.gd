extends Control
var aiScore = 0
var playerScore = 0
var cash = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$PlayerScore.set_text("P:" + str(playerScore))
	$AiScore.set_text("AI:" + str(playerScore))
	pass # Replace with function body.

func _process(_delta):
	$Points.set_text("🪙" + str(cash))
	pass
func _on_ball_new_round():
	visible = false
	pass # Replace with function body.

	

func _on_ball_ai_scored():
	aiScore += 1
	show()
	$AiScore.set_text("AI:" + str(aiScore))
	pass # Replace with function body.


func _on_ball_player_scored():
	playerScore += 1
	show()
	$PlayerScore.set_text("P:" + str(playerScore))
	
	pass # Replace with function body.


func _on_paddle_pointawarded():
	cash += 1
	pass # Replace with function body.
