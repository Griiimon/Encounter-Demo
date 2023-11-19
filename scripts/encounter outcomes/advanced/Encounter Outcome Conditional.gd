extends BaseEncounterOutcome
class_name EncounterOutcomeConditional

@export var outcome: BaseEncounterOutcome

@export var condition: Condition



func execute(party: Party, encounter: Encounter)-> OutcomeResult:
	return outcome.execute(party, encounter)


