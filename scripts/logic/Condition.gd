extends Resource
class_name Condition

@export var components: Array[BaseConditionComponent]


func is_true(party: Party, encounter: Encounter)-> bool:
	var formula: String
	for component in components:
		formula+= component.get_as_string(party, encounter)
	
	print("-- DEBUG: Evaluating Expression '", formula, "'") 
	var expression= Expression.new()
	assert(expression.parse(formula) == OK, "Can't parse formula " + formula)
	return expression.execute() == true
