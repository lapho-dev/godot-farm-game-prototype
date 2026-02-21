extends Node

@export var player: Player
@export var speed: float = 1

var vec_up: Vector2
var vec_down: Vector2
var vec_left: Vector2
var vec_right: Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		vec_up = Vector2(0, -1)
	elif event.is_action_released("up"):
		vec_up = Vector2(0, 0)
	if event.is_action_pressed("down"):
		vec_down = Vector2(0, 1)
	elif event.is_action_released("down"):
		vec_down = Vector2(0, 0)
	if event.is_action_pressed("left"):
		vec_left = Vector2(-1, 0)
	elif event.is_action_released("left"):
		vec_left = Vector2(0, 0)
	if event.is_action_pressed("right"):
		vec_right = Vector2(1, 0)
	elif event.is_action_released("right"):
		vec_right = Vector2(0, 0)
		
func _physics_process(delta: float) -> void:
	var direction = vec_up + vec_down + vec_left + vec_right
	var unit_vec = Vector2.ZERO
	if direction != Vector2.ZERO:
		unit_vec = direction.normalized()
	var velocity = speed * unit_vec
	player.velocity = velocity
	player.move_and_slide()
	#print(player.position)
