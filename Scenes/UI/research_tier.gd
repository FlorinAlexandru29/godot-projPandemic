extends Control
@onready var research_tier: Control = $"."
@onready var skill_tree_select_panel: VBoxContainer = $"../HBoxContainer/TeamsSelectPanel/SkillTreeSelectPanel"
const SKILL_SELECT_BUTTON = preload("uid://cv5t4uh28f2wb")
const SKILL_BUTTON = preload("uid://ynrmosy74ech")
const SKILL_TREE = preload("uid://bak1jrqepla27")
const BUTTON_WIDTH = 250
const TIER_VERTICAL_SPACING = 100  # space between tiers
const HORIZONTAL_SPACING = 20      # space between buttons horizontally
var bg := ButtonGroup.new()


func _ready() -> void:
	for skill_tree in Globals.skill_trees:
		#print (skill_tree)
		var new_skill_tree = SKILL_TREE.instantiate()
		new_skill_tree.name = skill_tree
		new_skill_tree.visible = false
		var tiers := {}
		var research_skill_tree = Globals.skill_trees[str(skill_tree)]
		for skill in research_skill_tree:
			#print (skill)
			var tier = skill["tier"]
			if not tiers.has(tier):
				tiers[tier] = []
			tiers[tier].append(skill)
		for tier in tiers.keys():
			var skills_in_tier = tiers[tier]
			var count = skills_in_tier.size()
			var total_width = count * BUTTON_WIDTH + (count - 1) * HORIZONTAL_SPACING
			var start_x = -total_width / 2
			for index in range(count):
				var skill = skills_in_tier[index]
				var newSkill_Button = SKILL_BUTTON.instantiate()
				newSkill_Button.title = skill["title"]
				newSkill_Button.description = skill["description"]
				newSkill_Button.price = int(skill["price"])
				var skill_root = []
				for root in skill["root"]:
					skill_root.append(int(root))
				newSkill_Button.root = skill_root
				# 3. Compute position
				var x = start_x + index * (BUTTON_WIDTH + HORIZONTAL_SPACING)
				var y = (tier - 1) * TIER_VERTICAL_SPACING + 50
				newSkill_Button.position = Vector2(x, y)
				new_skill_tree.add_child(newSkill_Button)
		research_tier.add_child(new_skill_tree)
		var new_skill_select_button = SKILL_SELECT_BUTTON.instantiate()
		new_skill_select_button.toggle_mode = true
		new_skill_select_button.button_group = bg
		new_skill_select_button.name = skill_tree
		skill_tree_select_panel.add_child(new_skill_select_button)
