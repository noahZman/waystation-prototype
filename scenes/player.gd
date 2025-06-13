extends CharacterBody2D

@export var speed := 200.0
@onready var sprite := $AnimatedSprite2D

func _physics_process(delta):
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	velocity = input_vector.normalized() * speed
	move_and_slide()

	if input_vector != Vector2.ZERO:
		update_animation(input_vector)
	else:
		sprite.play("idle_down") # or idle in last direction

func update_animation(direction: Vector2):
	if direction.x > 0:
		sprite.play("walk_right")
	elif direction.x < 0:
		sprite.play("walk_left")
	elif direction.y > 0:
		sprite.play("walk_down")
	elif direction.y < 0:
		sprite.play("walk_up")
