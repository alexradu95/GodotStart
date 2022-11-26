extends KinematicBody

# Declare member variables here. Examples:

export var _mouse_sensitivity := 0.1
export var _move_speed := 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Capture mouse event and rotate the character in the X Axis
func _input(event) -> void:
	aim(event)
	
# The keyboard can not be put in input because the value doesn't change when you move forward
func _physics_process(delta):
	# Can be named velocity
	movement()

	
func aim(event: InputEvent) -> void:
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		# we rotate the camera along the green axis
		# and we take the x position of our mouse
		# and we take the x position of our mouse
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivity;
		
		# prevent camera from doing a 360 on x axis
		var current_tilt: float = $Camera.rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * _mouse_sensitivity
		
		$Camera.rotation_degrees.x = clamp(current_tilt, -90, 90)
		
func movement() -> void:
	var movement_vector: Vector3
	var forward_movement: Vector3
	var sideways_movement: Vector3
	
	if Input.is_action_pressed("move_forward"):
		# we move by -1 because that is the way the character is facing
		forward_movement -= transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		forward_movement = transform.basis.z
		
	if Input.is_action_pressed("move_left"):
		sideways_movement = -transform.basis.x
	elif Input.is_action_pressed("move_right"):
		sideways_movement = transform.basis.x

	movement_vector = (forward_movement + sideways_movement) * _move_speed
	movement_vector = movement_vector.normalized()
	
	move_and_slide(movement_vector)
