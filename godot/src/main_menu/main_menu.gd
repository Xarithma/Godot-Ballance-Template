extends Control

# Tap input for the game to start.
onready var _start: int = $Start.connect("button_down", self, "_start_game")

# This can be any level/scene to be loaded first.
export var first_level: PackedScene


# Start the game with the first level.
func _start_game() -> void:
	var _change_scene: int =  get_tree().change_scene(first_level.resource_path)
