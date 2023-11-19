extends Resource
class_name BaseItem

enum Type { MELEE, RANGED, MAGIC }

var type: Type

func get_description()-> String:
	assert(false, "Calling get_description() on BaseItem class")
	return ""
