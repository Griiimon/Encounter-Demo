extends BaseConditionComponent
class_name ConditionComponentText

@export var text: String

func get_as_string(party: Party, encounter: Encounter)-> String:
	return text
