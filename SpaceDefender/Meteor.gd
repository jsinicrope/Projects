extends Area2D
class_name Meteor

# Declare member variables here. Examples:
var speed = 400
const images = [preload("res://spaceshooter/PNG/Meteors/meteorBrown_big1.png"), preload("res://spaceshooter/PNG/Meteors/meteorBrown_big3.png"), preload("res://spaceshooter/PNG/Meteors/meteorBrown_big4.png")]


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = images[round(rand_range(0,2))]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_y(speed*delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Meteor_body_entered(body):
	if body is Projectile:
		get_tree().get_root().get_node("World").score += 10
		queue_free()
		


func _on_Meteor_area_entered(area):
	if area is Player:
		queue_free()
		

