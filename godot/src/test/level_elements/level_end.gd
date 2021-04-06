extends MeshInstance

# Connect the Area to changing the level upon the player touching.
onready var _end = $MeshInstance/Area.connect("body_entered", self, "_finish_level")

# Connect tapping to change to next level.
onready var _tap = $Popup/Button.connect("button_down", self, "_change_level")

# Specify which map to load.
export var level_to_load: String


func _change_level() -> void:
	# Change to the specified scene.
	var _tmp: int = get_tree().change_scene(level_to_load)


# Load next level.
func _finish_level(body: Node) -> void:
	# If the body is not the player, don't run further.
	if not body.is_in_group("Player"):
		return

	# Show the end level popup.
	$Popup.show()
