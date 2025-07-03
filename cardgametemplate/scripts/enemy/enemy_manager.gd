extends Node

@export var enemy_board_path: NodePath
@export var enemy_scene: PackedScene
@export var pasta_inimigos: String = "res://data/enemies"

func _ready():
	var inimigo_files = listar_inimigos(pasta_inimigos)
	var enemy_board = get_node(enemy_board_path)

	for path in inimigo_files:
		var data = load(path)
		if data is EnemyData:
			var inimigo = enemy_scene.instantiate()
			inimigo.dados = data
			enemy_board.add_child(inimigo)

func listar_inimigos(caminho: String) -> Array:
	var lista = []
	var dir = DirAccess.open(caminho)
	if dir:
		dir.list_dir_begin()
		var file = dir.get_next()
		while file != "":
			if not dir.current_is_dir() and file.ends_with(".tres"):
				lista.append(caminho + "/" + file)
			file = dir.get_next()
	return lista
