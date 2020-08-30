extends KinematicBody2D

var velocity = Vector2(0, 0)
var gravity = 40
var terminal_vel = 250
var max_speed = 200
var accel = 25
var jump_speed = 1000

func _ready():
	pass
	
func _process(delta):
	
	var dx = 0
	if Input.is_action_pressed("ui_left"):
		dx = -accel
	if Input.is_action_pressed("ui_right"):
		dx = accel
	
	velocity.x = clamp( velocity.x + dx, -max_speed, max_speed )
	
	var dy = 0
	if Input.is_action_just_pressed("ui_jump"):
		dy = -jump_speed
	elif Input.is_action_just_released("ui_jump"):
		dy = -velocity.y + terminal_vel/2
	else:
		dy = gravity
	
	velocity.y = clamp( velocity.y + dy, -10000, terminal_vel )
func _physics_process(delta):
	var motion = Vector2(0, 0)
	motion += velocity
	
	move_and_slide(motion)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		





