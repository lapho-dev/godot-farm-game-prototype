extends Node

@export var interactable_component: InteractableComponent
@export var attack_component: AttackComponent

var current_target = null

func _ready() -> void:
	interactable_component.interact_player_to_object.connect(_on_interact_player_to_object)
	interactable_component.left_player_to_object.connect(_on_left_player_to_object)
	
func _on_interact_player_to_object(object_entity: Node) -> void:
	current_target = object_entity  # Set the target when entering

func _on_left_player_to_object(object_entity: Node) -> void:
	if current_target == object_entity:
		current_target = null  # Clear when exiting

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("use"):
		if current_target != null:
			var health_component: HealthComponent = null
			for child in current_target.get_parent().get_children():
				if child is HealthComponent:
					health_component = child
					break
			print(health_component)
			if health_component != null:
				attack_component.attack(health_component)
			
