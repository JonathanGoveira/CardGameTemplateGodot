extends Control
class_name CardBase

var dados: CardData
var habilidade: int
var mana_acoplada: int = 0
signal carta_jogada(carta: CardBase)

func _ready() -> void:
	atualizar_ui()
	
	# Garante que o node detecta cliques
	mouse_filter = Control.MOUSE_FILTER_STOP

	# Faz os filhos visuais ignorarem o clique
	$TextureRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Nome.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Dano.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Especie.mouse_filter = Control.MOUSE_FILTER_IGNORE

func atualizar_ui():
	if dados == null:
		return

	$TextureRect.texture = dados.imagem_carta
	$Nome.text = dados.nome
	$Dano.text = str(dados.dano_base)
	$Especie.text = dados.especie

func jogar():
	print("Carta jogada:", dados.nome)
	emit_signal("carta_jogada", self)
	queue_free()

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
