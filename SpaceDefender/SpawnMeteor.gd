extends Node2D


# Declare member variables here. Examples:
const Meteor = preload("res://Meteor.tscn")
const width = 480
const height = 720
var spawningarea = Rect2()
var delta = 2
var offset = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	spawningarea = Rect2(0, 0, width, 0)
	_set_next_spawn()
func _spawn_meteor():
	var meteor = Meteor.instance()
	var position = Vector2(randi()%width, 0)
	add_child(meteor)
	meteor.position = position
	return position
	
func _set_next_spawn():
	var next_time = delta + (randf() - 0.5)*offset
	$"../SpawnTimer".wait_time = next_time
	$"../SpawnTimer".start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpawnTimer_timeout():
	_spawn_meteor()
	_set_next_spawn()
