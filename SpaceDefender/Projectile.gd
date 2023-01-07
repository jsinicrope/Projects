extends KinematicBody2D
class_name Projectile

# Declare member variables here. Examples:
export var speed = 400
var direction = Vector2.UP
onready var raycast = $RayCast2D
onready var meteor = "res://Meteor.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	direction = direction.normalized()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var v = direction * speed * delta
	var c = move_and_collide(v)
	if raycast.is_colliding() :
		$Timer.start()
	if c and c.collider:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Timer_timeout():
	queue_free()
