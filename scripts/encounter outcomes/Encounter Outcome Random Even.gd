extends BaseEncounterOutcome
class_name EncounterOutcomeRandomEven


@export var options: Array[BaseEncounterOutcome]

func execute(party: Party, encounter: Encounter)-> OutcomeResult:
	return options.pick_random().execution_handler(party, encounter)
