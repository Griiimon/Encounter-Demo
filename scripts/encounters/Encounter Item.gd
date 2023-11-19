extends Encounter
class_name EncounterItem

@export var item: BaseItem


func get_description()-> String:
	return "You find an item: " + item.get_description()
