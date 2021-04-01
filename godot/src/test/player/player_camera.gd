extends Spatial


onready var _body: RigidBody = $RigidPlayer
onready var _cam: Camera = $Camera


func _ready() -> void:
	_cam.current = true


func _physics_process(delta: float) -> void:
	var _body_pos: Vector3 = _body.global_transform.origin
	var _cam_pos: Vector3 = _cam.global_transform.origin

	_cam_pos.x = lerp(_cam_pos.x, _body_pos.x + 10, delta)
	_cam_pos.z = lerp(_cam_pos.z, _body_pos.z, delta)
	
	_cam.global_transform.origin = _cam_pos

