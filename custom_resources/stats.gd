class_name Stats
extends Resource

signal stats_changed

@export var max_health := 1

var health: int: set = set_health
var block: int: set = set_block


func set_health(value : int) -> void:
	health = clampi(value, 0, max_health)
	stats_changed.emit()


func set_block(value : int) -> void:
	block = clampi(value, 0, 999)
	stats_changed.emit()


func take_damage(damage : int) -> void:
	if damage <= 0:
		return
	self.health -= damage
	
	
func heal(amount: int) -> void:
	self.health += amount
	
	
func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = 0
	instance.block = 0
	return instance
#hallo  
