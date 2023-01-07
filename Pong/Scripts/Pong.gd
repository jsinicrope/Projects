extends Node2D

#variables to track the score and threshold for winning
var scoreleft = 0
var scoreright = 0
var winscore = 5


func _process(delta):
	
	#when the ball hits the right side, left paddle score goes up and ball resets
	if get_node("ball").global_position.x > 638:
		scoreleft += 1
		$ball.reset_ball()
	
	#when the ball hits the left side, right paddle score goes up and ball resets
	if get_node("ball").global_position.x < 2:
		scoreright += 1
		$ball.reset_ball()
	
	#displays the scores
	get_node("ScoreLeft").set_text(str(scoreleft))
	get_node("ScoreRight").set_text(str(scoreright))
	
	#reveals win text when a player reaches 5 points
	if scoreleft >= winscore:
		$WinLabel.set_text("Left Player Wins!")
		$WinLabel.visible = true
	if scoreright >= winscore:
		$WinLabel.set_text("Right Player Wins!")
		$WinLabel.visible = true

#resets game when button pressed
func _on_Button_pressed():
	get_tree().reload_current_scene()
