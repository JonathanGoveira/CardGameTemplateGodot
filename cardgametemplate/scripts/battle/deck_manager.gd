# scripts/batlle/deck_manager.gd
extends Node

@export var carta_base_scene: PackedScene
@export var mao_container: NodePath = "Board/PlayerHand"
@export var max_cartas_mao: int = 5

# Cartas iniciais reais do deck
@export var cartas_iniciais: Array[Resource]  # Esperado: CardData

var deck: Array[CardData] = []
var cartas_na_mao: Array = []

func _ready():
	# Clona as cartas para o deck (evita sobrescrever o resource original)
	for carta_resource in GameState.cartas_selecionadas:
		var copia = carta_resource.duplicate()
		deck.append(copia)

	comprar_cartas(max_cartas_mao)

func comprar_cartas(qtd: int):
	var mao_node = get_node(mao_container)

	for i in range(qtd):
		if deck.is_empty():
			print("Deck vazio!")
			return

		var dados = deck.pop_front()
		var carta = carta_base_scene.instantiate()
		carta.dados = dados  # CardBase.gd deve ter um @export var dados: CardData
		cartas_na_mao.append(carta)
		mao_node.add_child(carta)

func ofertar_carta(carta: CardBase):
	cartas_na_mao.erase(carta)
	get_node(mao_container).remove_child(carta)
	deck.append(carta.dados)
	carta.queue_free()
