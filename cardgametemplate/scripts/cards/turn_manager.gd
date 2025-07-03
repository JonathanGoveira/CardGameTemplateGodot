extends Node

enum Fase {
	JOGADOR,
	INIMIGOS
}

var fase_atual: Fase = Fase.JOGADOR

@export var botao_encerrar_turno_path: NodePath
@export var enemy_board_path: NodePath
@export var deck_manager_path: NodePath
@export var enemy_manager_path: NodePath
func _ready():
	iniciar_turno_jogador()

func iniciar_turno_jogador():
	
	var deck = get_node(deck_manager_path)
	if deck.has_method("iniciar_turno_jogador"):
		deck.iniciar_turno_jogador()

	fase_atual = Fase.JOGADOR
	print("▶️ Turno do jogador")
	get_node(botao_encerrar_turno_path).show()

func encerrar_turno_jogador():
	if fase_atual != Fase.JOGADOR:
		return

	print("🛑 Jogador encerrou o turno.")
	get_node(botao_encerrar_turno_path).hide()
	fase_atual = Fase.INIMIGOS
	await iniciar_turno_inimigos()

func iniciar_turno_inimigos() -> void:
	print("☠️ Turno dos inimigos")

	var inimigos = get_node(enemy_board_path).get_children()
	var deck = get_node(deck_manager_path)

	for inimigo in inimigos:
		# inimigo causa dano futuramente
		print(inimigo, " Agindo")
		await get_tree().create_timer(0.5).timeout

	await get_tree().create_timer(0.8).timeout
	var enemy_manager = get_node(enemy_manager_path)
	if enemy_manager.todos_derrotados():

		print("🏆 Vitória! Todos os inimigos foram derrotados.")
		await get_tree().create_timer(1).timeout
		RunManager.ir_para_draft()
	else:
		iniciar_turno_jogador()



func _on_button_pressed() -> void:
	encerrar_turno_jogador()
