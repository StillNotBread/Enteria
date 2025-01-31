#metaname: card name
#card desciption
extends Card

func apply_effects(targets: Array[Node]) -> void:
	print("Something Happened")
	print("Targets: %s" % targets)
