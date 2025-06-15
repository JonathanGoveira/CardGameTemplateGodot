extends Control

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP
	$Panel.mouse_filter = MOUSE_FILTER_IGNORE
	
func _can_drop_data(_position, data) -> bool:
	#print("can_drop_data chamado no slot: ", name)
	return data is CardBase

func _drop_data(_position, data):
	print("Drop detectado no slot: ", name)

	if data.get_parent():
		data.get_parent().remove_child(data)

	add_child(data)
	data.position = Vector2.ZERO
