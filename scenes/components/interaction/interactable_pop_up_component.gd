extends Node
class_name InteractablePopUpComponent

@export var interactable_component: InteractableComponent


func _ready() -> void:
	interactable_component.interact_object_to_player.connect(on_interact_object_to_player)
	
func on_interact_object_to_player() -> void:
	
