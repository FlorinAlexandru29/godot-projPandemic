extends Node

var day=0
var month=0
var funds=0
<<<<<<< HEAD

func _ready() -> void:
	var skill_tree = load_skill_trees()
	print (skill_tree["fire_fighter_tree"].size())

func load_skill_trees() -> Dictionary:
	var file = FileAccess.open("res://save/skill_tree.json", FileAccess.READ)
	var content = file.get_as_text()
	print (content)
	return JSON.parse_string(content)
=======
var trustFactor=0
>>>>>>> 4b9c023664bb9f55d9b9afe5c7565d06c426b7cc
