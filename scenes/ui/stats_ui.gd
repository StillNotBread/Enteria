class_name StatsUI
extends VBoxContainer

@onready var block: HBoxContainer = $Block
@onready var block_progress: TextureProgressBar = %BlockProgress
@onready var health: HBoxContainer = $Health
@onready var health_progress: TextureProgressBar = %HealthProgress

func update_stats(stats: Stats) -> void:
	block_progress.value = stats.block
	health_progress.value = stats.health
	if health_progress.value >= health_progress.max_value:
		Events.player_died.emit()
	if block_progress.value >= block_progress.max_value:
		Events.battle_over_sceen_requested.emit("Victory", BattleOverPanel.Type.WIN)
