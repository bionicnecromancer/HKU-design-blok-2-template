extends CharacterBody3D


const SPEED = 10.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	
	var player = get_tree().get_first_node_in_group("player")
	
	$NavigationAgent3D.target_position = player.global_position
	#var direction = global_position.move_toward( $NavigationAgent3D.get_next_path_position(),SPEED * delta)
	#direction.y = 0
	#velocity = direction
	var direction = (player.global_position- global_position ).normalized()
	direction.y = 0
	velocity.x = lerp(velocity.x, 0.0,delta*2)
	velocity.z = lerp(velocity.z, 0.0,delta*2)
	velocity += direction * SPEED * delta
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#global_position = global_position.move_toward( $NavigationAgent3D.get_next_path_position(),SPEED * delta)
	
	move_and_slide()
