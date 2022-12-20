extends KinematicBody2D

var motion = Vector2(0, 0)

const SPEED = 1500
const GRAVITY = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 5000

signal animate
signal peek
signal camreset

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	peek()
	cam_reset()
	move_and_slide(motion, UP)

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)
	
func peek():
	if Input.is_action_pressed("rightarrow") and not Input.is_action_pressed("downarrow") and not Input.is_action_pressed("uparrow"):
		emit_signal("peek", "right")
	elif Input.is_action_pressed("leftarrow") and not Input.is_action_pressed("downarrow") and not Input.is_action_pressed("uparrow"):
		emit_signal("peek", "left")
	elif Input.is_action_pressed("uparrow") and not Input.is_action_pressed("rightarrow") and not Input.is_action_pressed("leftarrow"):
		emit_signal("peek", "up")
	elif Input.is_action_pressed("downarrow") and not Input.is_action_pressed("rightarrow") and not Input.is_action_pressed("leftarrow"):
		emit_signal("peek", "down")
	elif Input.is_action_pressed("rightarrow") and Input.is_action_pressed("downarrow"):
		emit_signal("peek", "downright")
	elif Input.is_action_pressed("rightarrow") and Input.is_action_pressed("uparrow"):
		emit_signal("peek", "upright")
	elif Input.is_action_pressed("leftarrow") and Input.is_action_pressed("downarrow"):
		emit_signal("peek", "downleft")
	elif Input.is_action_pressed("leftarrow") and Input.is_action_pressed("uparrow"):
		emit_signal("peek", "upleft")

func cam_reset():
	if is_on_floor():
		if not Input.is_action_pressed("right") and not Input.is_action_pressed("left") and not Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
			emit_signal('camreset')
