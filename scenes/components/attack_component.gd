extends Node
class_name AttackComponent

@export var attack_type: DataTypes.AttackType = DataTypes.AttackType.BasicAttack
@export var attack_damage: int = 1

func attack(health_component: HealthComponent) -> void:
	var target_type = health_component.attack_type
	
	if target_type == DataTypes.AttackType.BasicAttack:
		health_component.reduce_health(attack_damage)
	elif target_type == attack_type:
		health_component.reduce_health(attack_damage)
	else:
		if health_component.is_basic_attack_allowed:
			health_component.reduce_health(1)
