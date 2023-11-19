extends BaseEncounterOutcome
class_name EncounterOutcomePickupItem


func execute(party: Party, encounter: Encounter)-> OutcomeResult:
	assert(encounter is EncounterItem, "Encounter isn't of type EncounterItem")
	assert(encounter.item != null, "Encounter doesn't have an item")
	party.add_item(encounter.item)
	return OutcomeResult.default("You picked up " + encounter.item.get_description())

