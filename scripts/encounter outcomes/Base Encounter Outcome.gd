extends Resource
class_name BaseEncounterOutcome

@export var button_text: String
@export var custom_result_text: String


# intermediate function for more flexibility when intercepting
# automatic exectution flow ( don't know if it's necessary tbh )
func execution_handler(party: Party, encounter: Encounter)-> OutcomeResult:
	return execute(party, encounter)

func execute(party: Party, encounter: Encounter)-> OutcomeResult:
	assert(false, "Trying to execute EncounterOutcome on Base Class")
	return OutcomeResult.invalid()
