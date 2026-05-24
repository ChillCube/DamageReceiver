extends Area2D
class_name DamageReceiver

@export var hitflash: bool = true

var _hitflash: HitFlash

signal damage_received(amount: float)

func _ready() -> void:
	if hitflash:
		_hitflash = HitFlash.new()
	get_parent().add_child(_hitflash)

func take_damage(amount: float) -> void:
	if hitflash:
		_hitflash.flash()
	emit_signal("damage_received", amount)

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	_damage_received()

func _on_body_entered(body:Node2D):
	_damage_received()

func _damage_received():
	take_damage(0)
