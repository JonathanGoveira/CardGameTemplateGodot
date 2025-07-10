extends Control

@export var grade_container_path: NodePath
@export var carta_selectable_scene: PackedScene
@export var label_contador_path: NodePath
@export var botao_iniciar_path: NodePath
@export var max_cartas_selecionadas: int = 8
@export var path_data: String
var selecionadas: Array[CardData] = []

func _ready():
	var grade = get_node(grade_container_path)
	var arquivos_cartas = listar_todos_cards(path_data)

	for caminho in arquivos_cartas:
		var dados = load(caminho)
		if dados is CardData:
			var carta = carta_selectable_scene.instantiate()
			carta.dados = dados
			carta.connect("carta_selecionada", _on_carta_selecionada)
			carta.connect("carta_deselecionada", _on_carta_deselecionada)
			grade.add_child(carta)

	atualizar_ui()

func listar_todos_cards(caminho_base: String) -> Array:
	var lista = []
	var dir = DirAccess.open(caminho_base)

	if dir:
		dir.list_dir_begin()
		var nome = dir.get_next()
		while nome != "":
			if dir.current_is_dir():
				lista += listar_todos_cards(caminho_base + "/" + nome)
			elif nome.ends_with(".tres"):
				lista.append(caminho_base + "/" + nome)
			nome = dir.get_next()
	return lista

func _on_carta_selecionada(card_node):
	if selecionadas.size() >= max_cartas_selecionadas:
		card_node.selecionada = false
		card_node.get_node("MarcadorSelecionado").visible = false

		return

	selecionadas.append(card_node.dados)
	atualizar_ui()

func _on_carta_deselecionada(card_node):
	selecionadas.erase(card_node.dados)
	atualizar_ui()

func atualizar_ui():
	var label = get_node(label_contador_path)
	label.text = "Selecionadas: %d / %d" % [selecionadas.size(), max_cartas_selecionadas]

	var botao = get_node(botao_iniciar_path)
	#botao.disabled = selecionadas.size() != max_cartas_selecionadas


func on_start_pressed() -> void:
	DeckData.deck_atual = selecionadas.duplicate()
	RunManager.iniciar_run()

	#var caminho_batalha = "res://scenes/battle/battle_scene.tscn"
	#get_tree().change_scene_to_file(caminho_batalha)
	print("Mudando para a cena de batalha...")
