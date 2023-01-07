extends KinematicBody2D


# Declare member variables here. Examples:
var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

onready var edgecheckright = $EdgeCheckR
onready var edgecheckleft = $EdgeCheckL
onready var sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var found_wall = is_on_wall()
	var found_edge = not edgecheckright.is_colliding() or not edgecheckleft.is_colliding()
	if found_wall or found_edge:
		direction *= -1
	if not edgecheckright.is_colliding():
		$AnimatedSprite.flip_h = false
	elif not edgecheckleft.is_colliding():
		$AnimatedSprite.flip_h = true

	
	velocity = direction * 25
	move_and_slide(velocity, Vector2.UP)


func _on_Hitbox_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
