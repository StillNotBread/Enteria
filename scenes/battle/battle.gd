extends Node2D

@export var char_stats: CharacterStats

@onready var battle_ui: BattleUI = $BattleUI as BattleUI
@onready var player_handler: PlayerHandler = $PlayerHandler as PlayerHandler
@onready var player: Player = $Player as Player
@onready var lose_screen: CanvasLayer = $LoseScreen

@onready var info_button: Button = %InfoButton
@onready var info_screen: Panel = $HowToPlay/InfoScreen

func _ready() -> void:
	# this should be done in a new 'run'
	# level so we keep our health, gold, and deck
	# between battles
	var new_stats: CharacterStats = char_stats.create_instance()
	battle_ui.char_stats = new_stats
	player.stats = new_stats
	
	info_button.pressed.connect(show_info)

		
	Events.player_turn_ended.connect(player_handler.end_turn)
	Events.player_hand_discarded.connect(player_handler.start_turn) # used to be enemy handler
	Events.player_died.connect(_on_player_died)
	
	start_battle(new_stats)
	

func start_battle(stats: CharacterStats) -> void:
	player_handler.start_battle(stats)


func _on_player_died()-> void:
		Events.battle_over_sceen_requested.emit("Game Over", BattleOverPanel.Type.LOSE)

func show_info() -> void:
	info_screen.show()
