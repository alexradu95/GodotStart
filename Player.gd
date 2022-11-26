extends KinematicBody

# Declare member variables here. Examples:

export var _mouse_sensitivity := 0.1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Capture mouse event and rotate the character in the X Axis
func _input(event) -> void:
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivity

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
