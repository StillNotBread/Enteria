class_name Tooltip
extends PanelContainer

@export var fade_seconds := .2

@onready var tooltip_icon: TextureRect = %TooltipIcon
@onready var tooltip_text_label: RichTextLabel = %TooltipText
@onready var card_name: Label = %CardName

var tween: Tween
var is_visible = false


func _ready() -> void:
	Events.card_tooltip_requested.connect(show_tooltip)
	Events.tool_tip_hide_requested.connect(hide_tooltip)
	modulate = Color.TRANSPARENT
	hide()


func show_tooltip(icon: Texture, text: String, name: String) -> void:
	is_visible = true
	if tween:
		tween.kill()
	
	card_name.text = name
	tooltip_icon.texture = icon
	tooltip_text_label.text = text
	# tween animation
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(show)
	tween.tween_property(self, "modulate", Color.WHITE, fade_seconds)

func hide_tooltip() -> void:
	is_visible = false
	if tween:
		tween.kill()
	
	get_tree().create_timer(fade_seconds, false).timeout.connect(hide_animation)


func hide_animation() -> void:
	if not is_visible:
		tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(self, "modulate", Color.TRANSPARENT, fade_seconds)
		tween.tween_callback(hide)
