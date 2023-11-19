extends Resource
class_name Party

@export var characters: Array[Character]
@export var gold: int

func add_character(_character: Character):
	characters.append(_character)

func add_item(item: BaseItem):
	for character in characters:
		if character.item == null:
			character.item= item
			return
	#assert(false, "Nobody could equip " + item.get_description())

func get_description()-> String:
	if characters.is_empty(): return "Empty Party"
	var result:= ""
	for character in characters:
		result+= character.name
		if character.item:
			result+= str("  [", character.item.get_description(), "]")
		result+= "\n"
	return result
	
