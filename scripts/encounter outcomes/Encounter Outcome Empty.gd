extends BaseEncounterOutcome
class_name EncounterOutcomeEmpty

func execute(party: Party, encounter: Encounter)-> OutcomeResult:
	return OutcomeResult.default(custom_result_text)

