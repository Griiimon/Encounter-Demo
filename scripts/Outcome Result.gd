class_name OutcomeResult

enum Type { DEFAULT, NEW_ENCOUNTER, INVALID, COMBAT }

var type: Type
var parameter
var text: String


func _init(_type: Type= Type.DEFAULT, _parameter= null, _text: String= ""):
	type= _type
	parameter= _parameter
	text= _text


#convenience functions

static func default(_text: String)-> OutcomeResult:
	return OutcomeResult.new(Type.DEFAULT, null, _text)

static func invalid()-> OutcomeResult:
	return OutcomeResult.new(Type.INVALID)
	
