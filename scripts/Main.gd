extends CanvasLayer

# this should rather be loaded automatically from the encounter directory at start up
@export var encounters: Array[Encounter]

var party: Party

func _ready():
	init_party()
	
	for encounter in encounters:
		var button= Button.new()
		button.text= encounter.internal_name
		button.pressed.connect(start_encounter.bind(party, encounter))
		%"Encounter List".add_child(button)

	
func init_party():
	party= Party.new()
	#party.gold= 10
	var character= Character.new()
	character.item= Sword.new(10)
	party.add_character(character)


func _on_random_encounter_button_pressed():
	start_encounter(party, encounters.pick_random())


func start_encounter(party: Party, encounter: Encounter):
	# for debugging purposes we always want to make sure the
	# internal name is set, so we know whats going on
	assert(not encounter.internal_name.is_empty())
	prints("Starting encounter", encounter.internal_name)
	assert(encounter.outcomes.size() > 0, "Need at least 1 outcome in Encounter " + encounter.internal_name)
	
	if encounter.trigger_automatic_outcome:
		print("  ..automatic outcome trigger")
		#encounter.outcomes[0].execution_handler(party, encounter)
		trigger_outcome(party, encounter, encounter.outcomes[0])
		return

	%"Main Panel".hide()
	
	# clear previous buttons
	for child in %"Encounter HBox".get_children():
		child.queue_free()
	
	# wait for queue_free() to finish
	await get_tree().process_frame
	
	for outcome in encounter.outcomes:
		assert(outcome != null, "Empty outcome detected in " + encounter.internal_name)
		
		# Skip conditional outcomes if the condition check fails
		if outcome is EncounterOutcomeConditional and not outcome.condition.is_true(party, encounter):
			continue
		
		var button= Button.new()
		button.text= outcome.button_text
		button.pressed.connect(trigger_outcome.bind(party, encounter, outcome))
		%"Encounter HBox".add_child(button)
	
	%"Encounter Description".text= encounter.get_description()
	
	%"Encounter Panel".show()


func trigger_outcome(party: Party, encounter: Encounter, outcome: BaseEncounterOutcome):
	var result: OutcomeResult= outcome.execution_handler(party, encounter)
	
	assert(not result.text.is_empty(), "Empty result.text from Encounter " + encounter.internal_name)
	print("-> ", result.text)

	match result.type:
		OutcomeResult.Type.DEFAULT:
			quit_encounter()
		OutcomeResult.Type.NEW_ENCOUNTER:
			start_encounter(party, result.parameter)
		OutcomeResult.Type.COMBAT:
			start_combat(party, result.parameter)
		_:
			assert(false, "Unhandled OutcomeResult type " + str(result.type))



func start_combat(player_party: Party, enemy_party: Party):
	#assert(false, "Combat not implemented")
	print("You start combat against\n", enemy_party.get_description())
	quit_encounter()

func quit_encounter():
	%"Encounter Panel".hide()
	%"Main Panel".show()
