extends RigidBody

# Global-local variable for the force direction.
var _direction: Vector3 = Vector3.ZERO

# Ground checking raycast.
onready var ray = $RayCast


func _process(_delta: float) -> void:
	# Get the direction from input.
	_get_direction()


func _physics_process(_delta: float) -> void:
	# Put the player back to the start if they fall.
	if global_transform.origin.y < -5:
		var _reload: int = get_tree().reload_current_scene()

	# Apply the force to the rigid-body.
	apply_central_impulse(_direction)


func _get_direction() -> void:
	# Reset the vector.
	_direction = Vector3.ZERO

	# Set the direction to move towards.
	_direction.z = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	_direction.x = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	# Normalise the vector
	_direction = _direction.normalized() / 5
