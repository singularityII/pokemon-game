extends Area2D

@export var next_scene_path = "" # (String, FILE)
@export var is_invisible: bool = false

@export var spawn_location: Vector2 = Vector2(0, 0)
@export var spawn_direction: Vector2 = Vector2(0, 0)

@onready var sprite = $Sprite2D
@onready var anim_player = $AnimationPlayer


var player_entered = false

func _ready():
	if is_invisible:
		$Sprite2D.texture = null
	sprite.visible = false
	var player = Utils.get_player()
	player.connect("player_entering_door_signal", Callable(self, "enter_door"))
	player.connect("player_entered_door_signal", Callable(self, "close_door"))
	
func enter_door():
	if player_entered:
		anim_player.play("OpenDoor")
	
func close_door():
	if player_entered:
		anim_player.play("CloseDoor")

func door_closed():
	if player_entered:
		Utils.get_scene_manager().transition_to_scene(next_scene_path, spawn_location, spawn_direction)


func _on_Door_body_entered(body):
	player_entered = true


func _on_Door_body_exited(body):
	player_entered = false
