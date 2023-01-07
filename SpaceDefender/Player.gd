extends Area2D
class_name Player

# Declare member variables here. Examples:

export var speed = 400
var delta_value = 10
onready var cooldown_timer = $Timer
onready var raycast = $RayCast2D
var projectile_scene = preload("res://Projectile.tscn")
var can_fire = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right") and global_position.x < 430:
		move_local_x(speed*delta)
	if Input.is_action_pressed("left") and global_position.x > 50:
		move_local_x(-speed*delta)
	if Input.is_action_pressed("shoot") and can_fire:
		_spawn_projectile()
		can_fire = false
		cooldown_timer.start()

func _spawn_projectile():
	var direction = Vector2.UP.rotated(global_rotation)
	var projectile = projectile_scene.instance()
	projectile.direction = direction
	projectile.global_position = raycast.global_position
	add_child(projectile)
	




func _on_Timer_timeout():
	can_fire = true



