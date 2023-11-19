extends BaseConditionComponent
class_name ConditionComponentDynamicValue

enum Source { Party, Character }

@export var source: Source
@export var property: String

func get_as_string(party: Party, encounter: Encounter)-> String:
	match source:
		Source.Party:
			return str(party.get(property))
		Source.Character:
			assert(false, "Not Implemented")
	
	return ""
