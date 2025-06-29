extends Control
class_name CardBase

@export var dados: CardData
var habilidade: int
var mana_acoplada: int = 0

func _ready() -> void:
	atualizar_ui()

	# Garante que o node detecta cliques
	mouse_filter = Control.MOUSE_FILTER_STOP

	# Faz os filhos visuais ignorarem o clique
	$TextureRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$nome.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$dano.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$descricaoDom.mouse_filter = Control.MOUSE_FILTER_IGNORE

func atualizar_ui():
	if dados == null:
		return

	$TextureRect.texture = dados.imagem_carta
	$nome.text = dados.nome
	$dano.text = str(dados.dano_base)
	$descricaoDom.text = dados.descricao_dom

# Início do drag
func _get_drag_data(at_position: Vector2) -> Variant:
	print("Iniciando drag da carta: ", dados.nome)

	var preview = duplicate()
	preview.modulate = Color(1, 1, 1, 0.6)
	set_drag_preview(preview)
	return self

# Obrigatório mesmo que não use
func _can_drop_data(_position, data):
	return false

func _drop_data(_position, data):
	pass
