extends Node

@onready var iniciar_button = $MarginContainer/VBoxContainer/Iniciar
@onready var label_selecao = $MarginContainer/VBoxContainer/Decks

func _ready():
	iniciar_button.disabled = true

func _on_deck_selecionado(nome: String):
	var pasta = "res://scripts/cards/data/" + nome.to_lower()
	var carta_paths = pegar_caminhos_tres_na_pasta(pasta)
	var cartas: Array[CardData] = []

	for path in carta_paths:
		var res = load(path)
		if res is CardData:
			cartas.append(res)

	DeckData.definir_deck(cartas)
	label_selecao.text = "Selecionado: " + nome
	iniciar_button.disabled = false

func pegar_caminhos_tres_na_pasta(pasta: String) -> Array:
	var paths = []
	var dir = DirAccess.open(pasta)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".tres"):
				paths.append(pasta + "/" + file_name)
			file_name = dir.get_next()
	return paths
