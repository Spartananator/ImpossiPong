extends CharacterBody2D
@export var playercontrolled = true
@export var speed = 100

var mouse_position
var ballposition = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ballposition = $"../Ball".get("position")
	var AIdirection = (ballposition.y - position.y)
	velocity.y = (AIdirection * speed)
	move_and_collide((velocity * delta))
	

	


