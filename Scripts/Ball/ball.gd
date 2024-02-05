extends CharacterBody2D
@export var speed = 700
var veloc = Vector2.ZERO
var location = Vector2.ZERO
var start = Vector2.ZERO
signal player_scored
signal ai_scored
signal new_round
# Called when the node enters the scene tree for the first time.
func _ready():
	veloc.x = [1,-1][randi() % 2]
	veloc.y = [0.8,0.3,0.5,-0.8,-0.3,-0.5][randi() % 6]
	velocity = (veloc * speed)
	start = position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collisiondetect = move_and_collide((velocity * delta))
	if collisiondetect:
		velocity = velocity.bounce(collisiondetect.get_normal())
		velocity.y += [0.1,-0.1,0.0,0.2,-0.2,0.3,-0.3][randi() % 7]
		if velocity.x > 0.0:
			velocity.x += 10.0
		elif velocity.x < 0.0:
			velocity.x += -10.0
		print(velocity.x)
		print(collisiondetect.get("Group"))
		
	

func _on_area_2d_body_entered(_body):
	position = start
	velocity = Vector2.ZERO
	emit_signal("ai_scored")
	pass # Replace with function body.



func _on_area_2d_2_body_entered(_body):
	position = start
	velocity = Vector2.ZERO
	emit_signal("player_scored")
	pass # Replace with function body.



func _new_round():
	veloc.x = [1,-1][randi() % 2]
	veloc.y = [0.8,0.3,0.5,-0.8,-0.3,-0.5][randi() % 6]
	velocity = (veloc * speed)
	position = start
	pass # Replace with function body.


func _on_button_pressed():
	emit_signal("new_round")
	_new_round()
	pass # Replace with function body.
