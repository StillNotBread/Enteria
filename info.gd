extends Panel

@onready var play_button: Button = %PlayButton

@onready var info_screen: Panel = $"."


func _ready() -> void:
	play_button.pressed.connect(hide_screen)

func hide_screen() -> void:
	hide()
