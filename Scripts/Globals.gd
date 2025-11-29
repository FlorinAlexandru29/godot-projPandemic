extends Node

var day=0
var month=0
var funds=0
var skill_trees = load_skill_trees()
var trustFactor1=701.0 + randi()%200
var trustFactor2=701.0 + randi()%200
var trustFactor3=701.0 + randi()%200
var trustFactor4=701.0 + randi()%200
var trustFactor5=701.0 + randi()%200
var trustFactor = (trustFactor1+trustFactor2+trustFactor3+trustFactor4+trustFactor5)/5

func load_skill_trees() -> Dictionary:
	var file = FileAccess.open("res://saves/skill_tree.json", FileAccess.READ)
	var content = file.get_as_text()
	#print (content)
	return JSON.parse_string(content)
