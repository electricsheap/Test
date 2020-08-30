extends KinematicBody2D

var velocity = Vector2(0, 0)
var gravity = 10
var terminal_vel = 100

func _ready():
	pass
	
func _process(delta):
	velocity.y = clamp( velocity.y + gravity,  )

func _physics_process(delta):
	var motion = Vector2(0, 0)
	motion += velocity * delta
	move_and_collide(motion)

