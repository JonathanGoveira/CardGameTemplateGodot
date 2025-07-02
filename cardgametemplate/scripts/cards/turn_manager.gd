extends Node

enum Fase {
	JOGADOR,
	INIMIGOS
}

var fase_atual: Fase = Fase.JOGADOR

@export var botao_encerrar_turno_path: NodePath
@export var enemy_board_path: NodePath
@export var deck_manager_path: NodePath

func _ready():
	iniciar_turno_jogador()

func iniciar_turno_jogador():
	fase_atual = Fase.JOGADOR
	print("▶️ Turno do jogador")
	get_node(botao_encerrar_turno_path).show()

func encerrar_turno_jogador():
	if fase_atual != Fase.JOGADOR:
		return

	get_node(botao_encerrar_turno_path).hide()
	fase_atual = Fase.INIMIGOS
	iniciar_turno_inimigos()

func iniciar_turno_inimigos():
	print("☠️ Turno dos inimigos")

	var inimigos = get_node(enemy_board_path).get_children()
	var deck = get_node(deck_manager_path)

	for inimigo in inimigos:
		if inimigo.has_method("get_dano"):
			var dano = inimigo.get_dano()
			deck.sofrer_dano(dano)

	await get_tree().create_timer(1.0).timeout  # Delay simbólico
	iniciar_turno_jogador()
