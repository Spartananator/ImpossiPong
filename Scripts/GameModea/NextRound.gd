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
	
	pass

func _on_ball_ai_scored():
	aiScore += 1
	_show()
	$AiScore.set_text("AI:" + str(aiScore))
	pass # Replace with function body.


func _on_ball_player_scored():
	playerScore += 1
	_show()
	$PlayerScore.set_text("P:" + str(playerScore))
	
	pass # Replace with function body.
func _show():
	$Points.set_text("🪙" + str(cash))
	show()

func _on_paddle_pointawarded():
	cash += 1
	pass # Replace with function body.


func _on_new_round_pressed():
	hide()
	pass # Replace with function body.


func _on_close_game_pressed():
	get_tree().quit()
	pass # Replace with function body.
