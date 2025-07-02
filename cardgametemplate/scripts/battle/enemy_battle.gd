# res://Combate/InimigoNode.gd
extends Control

@export var nome: String = "Desconhecido"
@export var vida: int = 5

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP
	$Panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Nome.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Vida.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Dano.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Nome.text = nome
	atualizar_vida()

func atualizar_vida():
	$Vida.text = "❤️ " + str(vida)

func _can_drop_data(_pos, data) -> bool:
	return data is CardBase

func _drop_data(_pos, data):
	if data is CardBase:
		var dano = data.dados.dano_base
		vida -= dano
		print("Recebeu " + str(dano) + " de dano!")
		if vida <= 0:
			queue_free()
		else:
			atualizar_vida()
		
		# Remove carta do campo
		data.get_parent().remove_child(data)
		data.queue_free()  # ou retornar_ao_deck() se preferir reaproveitar
