extends CharacterBody2D

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()

var player_near = false
var terminate = 1
var player = null

# i just need bro to turn
func _physics_process(_delta):
	if player_near == true:
		if(player.position.y - position.y) > 0:
			$AnimationPlayer.play("idle_down")
			
		if(player.position.x - position.x + 20) < 0:
			$AnimationPlayer.play("idle_left")
			
		if(player.position.y - position.y + 20) < 0:
			$AnimationPlayer.play("idle_up")
			
	else:
		$AnimationPlayer.play("idle_down")

# to battle
func _on_area_2d_body_entered(body):
	player = body
	player_near = true


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	player = body
	player_near = false
