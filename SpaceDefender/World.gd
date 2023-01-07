extends Node2D


# Declare member variables here. Examples:
onready var hit = false
onready var score = 0
onready var lives = 3
onready var level = 1
onready var spawn = $SpawnMeteor

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_lives(lives)
	VisualServer.set_default_clear_color(Color.black)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_increace_level()
	_update_level(level)
	_update_score(score)
	_update_lives(lives)
	if lives == 0:
		$GameOver.visible = true
	if hit == true:
		$Player/CollisionPolygon2D.disabled = true
	if hit == false:
		$Player/CollisionPolygon2D.disabled = false

func _update_lives(lives):
	$Lives.text = str(lives)

func _update_score(score):
	$Score.text = str(score)
	
func _update_level(level):
	$Level.text = str(level)

func _on_Earth_area_entered(area):
	if area is Meteor:
		lives = lives - 1


func _on_Player_area_entered(area):
	if area is Meteor:
		lives = lives - 1
		hit = true
		$DamageTimer.start()
		$Player/AnimatedSprite.animation = "Hit"
	


func _on_DamageTimer_timeout():
	hit = false
	$Player/AnimatedSprite.animation = "default"

func _increace_level():
	if score >= 100:
		level += 1
		score = 0
		spawn.offset -= 1


func _on_Button_pressed():
	get_tree().reload_current_scene()
