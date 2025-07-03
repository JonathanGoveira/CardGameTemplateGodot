extends Node
class_name EnemyManager

@export var enemy_scene: PackedScene  # Cena única: ex: res://scenes/enemy/enemy_base.tscn
@export var enemy_board_path: NodePath = "../Enemies"

var inimigos_data: Array = []

func _ready():
	# Carrega os inimigos da batalha atual definidos no RunManager
	carregar_inimigos(RunManager.inimigos_da_batalha)

func carregar_inimigos(lista: Array):
	inimigos_data = lista
	var board = get_node(enemy_board_path)

	# Limpa inimigos anteriores
	for child in board.get_children():
		child.queue_free()

	# Instancia inimigos com progressão
	for dados in lista:
		var inimigo = enemy_scene.instantiate()
		
		# Seta os dados
		inimigo.dados = dados

		# Escala a vida com base na progressão da run
		var base_vida = dados.vida_base
		var multiplicador = RunManager.numero_da_batalha
		inimigo.vida = base_vida + (multiplicador * 2)

		# Atualiza UI (se o método existir)
		if inimigo.has_method("atualizar_vida"):
			inimigo.atualizar_vida()

		board.add_child(inimigo)

func get_inimigos() -> Array:
	var board = get_node(enemy_board_path)
	return board.get_children()

func todos_derrotados() -> bool:
	for inimigo in get_inimigos():
		if is_instance_valid(inimigo):
			return false
	return true
