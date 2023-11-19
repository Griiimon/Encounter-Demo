extends BaseEncounterOutcome
class_name EncounterOutcomeRecursive


func execute(party: Party, encounter: Encounter)-> OutcomeResult:
	return OutcomeResult.new(OutcomeResult.Type.NEW_ENCOUNTER, encounter, custom_result_text)
