extends AnimatedSprite2D

var playing

# Called when the node enters the scene tree for the first time.
func _ready():
	frame = 0
	playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GrassStepEffect_animation_finished():
	queue_free()
