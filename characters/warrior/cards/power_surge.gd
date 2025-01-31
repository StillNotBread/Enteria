extends Card


func apply_effects(targets: Array[Node]) -> void:
	var block_effect := BlockEffect.new()
	block_effect.amount = 25
	block_effect.execute(targets)
	var heal_effect := HealEffect.new()
	heal_effect.amount = 5
	heal_effect.execute(targets)
