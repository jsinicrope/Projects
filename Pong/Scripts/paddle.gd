extends Area2D

export var player_index = 0
var speed = 500



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_index == 0:
		if Input.is_action_pressed("left_input_up") and global_position.y > 20:
			#move up
			move_local_y(-speed*delta)
		if Input.is_action_pressed("left_input_down") and global_position.y < 380:
			#move down
			move_local_y(speed*delta)
			
	if player_index == 1:
		if Input.is_action_pressed("right_input_up") and global_position.y > 20:
			#move up
			move_local_y(-speed*delta)
		if Input.is_action_pressed("right_input_down") and global_position.y < 380:
			#move down
			move_local_y(speed*delta)
		
	



