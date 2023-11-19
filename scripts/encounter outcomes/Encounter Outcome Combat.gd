extends BaseEncounterOutcome
class_name EncounterOutcomeCombat

# 100 = all members of enemy party will go into combat, less to randomly reduce amount
@export var chance_member_involved: float= 100

func execute(party: Party, encounter: Encounter)-> OutcomeResult:
	var final_enemy_party:= Party.new()
	
	for member in encounter.enemy_party.characters:
		if randf() * 100 < chance_member_involved:
			final_enemy_party.add_character(member)
	
	if final_enemy_party.characters.is_empty():
		return OutcomeResult.new(OutcomeResult.Type.DEFAULT, final_enemy_party, "All enemies are fleeing")
	
	return OutcomeResult.new(OutcomeResult.Type.COMBAT, final_enemy_party, custom_result_text)
