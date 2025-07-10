# autoload/DeckData.gd
extends Node

var deck_atual: Array[CardData] = []

func definir_deck(deck: Array[CardData]) -> void:
	deck_atual = deck.duplicate(true)  # cópia profunda

func obter_deck() -> Array[CardData]:
	return deck_atual
