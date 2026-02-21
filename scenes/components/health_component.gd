extends Node
class_name HealthComponent


@export var max_health: int = 1
@export var attack_type: DataTypes.AttackType = DataTypes.AttackType.BasicAttack
@export var is_basic_attack_allowed: bool = true
var current_health: int

signal health_zero

func _ready() -> void:
	current_health = max_health

func reduce_health(damage: int) -> void:
	current_health -= damage
	if current_health < 0:
		current_health = 0
		health_zero.emit()
		print("Health is dropped to zero")
	print(get_parent().name, " current health: ", current_health)

func increase_health(health: int) -> void:
	current_health += health
	if current_health > max_health:
		current_health = max_health
