extends Control

@export var dados: EnemyData

func _ready():
	if dados:
		$Nome.text = dados.nome
		$Vida.text = "❤️ " + str(dados.vida_base)
		$Dano.text = "⚔ " + str(dados.dano_base)
		$TextureRect.texture = dados.imagem_carta
