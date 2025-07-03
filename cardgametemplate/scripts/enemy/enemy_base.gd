extends Control
class_name EnemyBase

@export var dados: EnemyData  # Resource que carrega nome, sprite, vida_base, etc
@export var vida: int = 10

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP
	$TextureRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Nome.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Vida.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Dano.mouse_filter = Control.MOUSE_FILTER_IGNORE

	if dados:
		$Nome.text = dados.nome
		$TextureRect.texture = dados.imagem_carta
		vida = dados.vida_base
	atualizar_vida()

func atualizar_vida():
	$Vida.text = "❤️ " + str(vida)

func _can_drop_data(_pos, data) -> bool:
	return data is CardBase

func _drop_data(_pos, data):
	if data is CardBase:
		var dano = data.dados.dano_base
		vida -= dano
		print("🔻 ", dados.nome, " sofreu ", dano, " de dano!")

		if vida <= 0:
			queue_free()
		else:
			atualizar_vida()

		# Remove a carta da mão visualmente
		if data.get_parent():
			data.get_parent().remove_child(data)
		data.queue_free()

		# Emite sinal (futuramente podemos emitir algo como "inimigo_derrotado")
