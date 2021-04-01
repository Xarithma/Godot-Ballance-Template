extends RigidBody

# Global-local variable for the force direction.
var _direction: Vector3 = Vector3.ZERO


func _process(_delta: float) -> void:
	# Get the direction from input.
	_get_direction()


func _physics_process(_delta: float) -> void:
	# Apply the force to the rigid-body.
	apply_torque_impulse(_direction)


func _get_direction() -> void:
	# Reset the vector.
	_direction = Vector3.ZERO

	# Set the direction to move towards.
	_direction.x = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	_direction.z = Input.get_action_strength("move_up") - Input.get_action_strength("move_down")

	# Normalise the vector
	_direction = _direction.normalized()
