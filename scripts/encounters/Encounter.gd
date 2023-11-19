extends Resource
class_name Encounter

# for debugging
@export var internal_name: String
@export var description: String

@export var outcomes: Array[BaseEncounterOutcome]

# potential enemies
@export var enemy_party: Party

# immediately execute the first outcome when this Encounter starts
# for example getting pulled into a fight as a result of some
# random outcome
@export var trigger_automatic_outcome: bool= false

# override to generate custom descriptions for specific encounters
func get_description()-> String:
	return description
