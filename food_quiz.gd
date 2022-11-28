extends Spatial

# Dialog text is loaded as NodePath in the editor
# onReady => asign it whatever is after the equal
export(Resource) var _dialogue = _dialogue as Dialogue

func _ready():
	pass # Replace with function body.



func _on_DialogTrigger_body_entered(body):
	GameEvents.emit_signal("dialog_initiated", _dialogue)
	
