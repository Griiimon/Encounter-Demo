extends BaseItem
class_name Sword

@export var damage: int


# Resource._init() arguments need default values or they will
# throw an error(?)
func _init(_damage: int= 1):
	type= Type.MELEE
	damage= _damage


func get_description()-> String:
	return str("Sword (Dmg: ", damage, ")")
