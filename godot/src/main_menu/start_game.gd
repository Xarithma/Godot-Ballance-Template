extends MeshInstance

onready var _tmp = $Area.connect("body_entered", self, "_start_game")


func _start_game(body: Node) -> void:
    if not body.is_in_group("Player"):
        return
    
    var _start = get_tree().change_scene("res://src/test/levels/level_01.tscn")

