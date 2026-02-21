extends Area2D
class_name InteractableComponent

enum POV {Player, AI, Object}

@export var self_pov: POV = POV.Object

signal interact_object_to_player(player: InteractableComponent)
signal interact_player_to_object(object: InteractableComponent)
signal left_player_to_object(object: InteractableComponent)

func get_pov() -> POV:
	return self_pov

func _on_area_entered(area: Area2D) -> void:
	if !area is InteractableComponent:
		return
	var interactable: InteractableComponent = area as InteractableComponent
	
	if self_pov == POV.Player && interactable.get_pov() == POV.Object:
		interact_player_to_object.emit(interactable)
		print("collided")
		
	if self_pov == POV.Object && interactable.get_pov() == POV.Player:
		interact_object_to_player.emit(interactable)


func _on_area_exited(area: Area2D) -> void:
	if !area is InteractableComponent:
		return
	var interactable: InteractableComponent = area as InteractableComponent
	
	if self_pov == POV.Player && interactable.get_pov() == POV.Object:
		left_player_to_object.emit(interactable)
