extends Button

@onready var research_tier = get_node("/root/main/UILayer/UI/Research/ResearchTier")
@onready var label: Label = get_node("/root/main/UILayer/UI/Research/HBoxContainer/ResearchPanel/Label")
@onready var skill_select_button: Button = $"."






func _on_toggled(toggled_on: bool) -> void:
	var id = get_index()
	var list = research_tier.get_children()
	list[id].visible = toggled_on
	label.text = skill_select_button.name
