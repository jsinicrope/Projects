extends Area2D


#Variables for the ball's speed, starting position
export var speed = Vector2(10, 3)
var startPos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	startPos = position
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#the speed of the ball * every tick
	translate(speed*delta)
	
	#bounces ball off of screen borders
	if global_position.x > 638:
		speed.x *= -1
	if global_position.x < 2:
		speed.x *= -1
	if global_position.y > 398:
		speed.y *= -1
	if global_position.y < 2:
		speed.y *= -1
	


func _on_ball_area_entered(area):
	bounce()
	
func bounce():
	#the ball bounces in the opposite direction, randomly along the y axis
	speed.y += rand_range(-50, 50)
	speed.x *= -1
	$AudioStreamPlayer.play()
	
	
func reset_ball():
	position = startPos
