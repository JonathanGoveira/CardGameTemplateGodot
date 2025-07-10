# scripts/batlle/deck_manager.gd
extends Node

@export var carta_base_scene: PackedScene
@export var mao_container: NodePath = "Board/PlayerHand"
@export var max_cartas_mao: int = 3
@export var deck_vida_label_path: NodePath


# Cartas iniciais reais do deck
#@export var cartas_iniciais: Array[Resource]  # Esperado: CardData

var deck: Array[CardData] = []
var cartas_na_mao: Array = []

func _ready():
	# Clona as cartas para o deck (evita sobrescrever o resource original)
	for carta_resource in DeckData.deck_atual:
		var copia = carta_resource.duplicate()
		deck.append(copia)

	comprar_cartas(max_cartas_mao)
	atualizar_label_vida()
	
func comprar_cartas(qtd: int):
	var mao_node = get_node(mao_container)

	for i in range(qtd):
		if deck.is_empty():
			print("Deck vazio!")
			return

		var dados = deck.pop_front()
		var carta = carta_base_scene.instantiate()
		carta.dados = dados

		# 🔗 Aqui conectamos o sinal da carta
		carta.connect("carta_jogada", self._on_carta_jogada)


		cartas_na_mao.append(carta)
		mao_node.add_child(carta)


func _on_carta_jogada(carta: CardBase):
	print("DeckManager detectou que a carta foi jogada: ", carta.dados.nome)
	remover_da_mao(carta)
	# Coloca os dados no final do deck
	deck.append(carta.dados)

func remover_da_mao(carta: CardBase):
	if carta in cartas_na_mao:
		cartas_na_mao.erase(carta)


#func ofertar_carta(carta: CardBase):
#	cartas_na_mao.erase(carta)
#	get_node(mao_container).remove_child(carta)
#	deck.append(carta.dados)
#	carta.queue_free()

func iniciar_turno_jogador():
	atualizar_label_vida()
	var qtd_faltando = max_cartas_mao - cartas_na_mao.size()
	if qtd_faltando > 0:
		comprar_cartas(qtd_faltando)
	print("entrou para comprar cartas ", deck.size(), " ", cartas_na_mao.size())


func atualizar_label_vida():
	var label = get_node(deck_vida_label_path)
	label.text = "Deck: " + str(deck.size() + cartas_na_mao.size())
