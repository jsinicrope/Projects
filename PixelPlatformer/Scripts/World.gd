extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	VisualServer.set_default_clear_color(Color.lightblue)
	$WinText.visible = false
	$Button.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().reload_current_scene()


func _on_Goal_body_entered(body):
	$Label.visible = true
	$Button.visible = true
