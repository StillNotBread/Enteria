class_name BattleOverPanel
extends Panel

enum Type {WIN, LOSE}

@onready var label: Label = %Label
@onready var give_up: Button = %GiveUp
@onready var start_over: Button = %StartOver

func _ready() -> void:
	give_up.pressed.connect(get_tree().quit)
	start_over.pressed.connect(get_tree().reload_current_scene)
	Events.battle_over_sceen_requested.connect(show_screen)

func show_screen(text: String, type: Type) -> void:
	label.text = text
	give_up.visible = type == Type.WIN or type == Type.LOSE
	start_over.visible = type == Type.LOSE or type == Type.WIN
	show()
