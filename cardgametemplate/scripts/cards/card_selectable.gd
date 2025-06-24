extends Control

@export var dados: CardData

signal carta_selecionada(card)
signal carta_deselecionada(card)

var selecionada := false

func _ready():
	atualizar_ui()

func atualizar_ui():
	$TextureRect.texture = dados.imagem_carta
	$Nome.text = dados.nome
	$Dano.text = str(dados.dano_base)
	$Dom.text = dados.descricao_dom
	$MarcadorSelecionado.visible = selecionada

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		selecionada = !selecionada
		$MarcadorSelecionado.visible = selecionada
		if selecionada:
			emit_signal("carta_selecionada", self)
		else:
			emit_signal("carta_deselecionada", self)
