extends KinematicBody2D
class_name Player

export var jump_force = -100
export var jump_height = -60
export var max_speed = 50
export var delta_value = 10
export var gravity = 4
var velocity = Vector2.ZERO


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	_apply_gravity()
	
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if input.x == 0:
		_apply_friction()
		$AnimatedSprite.animation = "Idle"
	else:
		_apply_acceleration(input.x)
		$AnimatedSprite.animation = "Run"
		
		if input.x > 0:
			$AnimatedSprite.flip_h = true
		elif input.x < 0:
			$AnimatedSprite.flip_h = false
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_force
	else:
		$AnimatedSprite.animation = "Jump"
		if Input.is_action_just_released("jump") and velocity.y < jump_height:
			velocity.y = jump_height
			
		if velocity.y > 0:
			_apply_gravity()
			
	var was_in_air = not is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	var just_landed = is_on_floor() and was_in_air
	if just_landed:
		$AnimatedSprite.animation = "Run"
		$AnimatedSprite.frame = 1

func _apply_gravity():
	velocity.y += gravity
	velocity.y = min(velocity.y, 300)

func _apply_friction():
	velocity.x = move_toward(velocity.x, 0, delta_value)
func _apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, max_speed*amount, delta_value)
	
