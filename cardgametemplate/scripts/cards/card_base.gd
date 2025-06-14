extends Control

class_name CardBase

@export var dados: CardData
var habilidade: int
var mana_acoplada: int = 0

func _ready() -> void:
	atualizar_ui()
	
func atualizar_ui():
	if dados == null:
		return
	
	$TextureRect.texture = dados.imagem_carta
	$nome.text = dados.nome
	$dano.text = str(dados.dano_base)
	$descricaoDom.text = dados.descricao_dom
