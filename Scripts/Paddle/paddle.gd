extends CharacterBody2D
@export var playercontrolled = true
@export var speed = 20
var collision
var mouse_position
var ballposition = Vector2.ZERO
var impartforce = null
signal pointawarded
# Called when the node enters the scene tree for the first time.
func _ready():
	collision = null
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playercontrolled == true:
		var direction = (get_global_mouse_position().y - position.y)
		velocity.y = (direction*speed)
		collision = move_and_collide((velocity * delta))
		#if collision.get_collider().Name() == "Ball":
			#emit_signal("pointawarded")
			
	impartforce = velocity
	
	
func _on_area_2d_body_entered(body):
	if body.name.match("**Ball****") :
		emit_signal("pointawarded")
	if body.has_method("_speed_up"):
		body._speed_up()
	pass # Replace with function body.
