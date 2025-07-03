extends Node

## Número da batalha atual
var numero_da_batalha: int = 0

## Lista de Doms coletados na run (pode ser atualizado com dados reais depois)
var doms_coletados: Array = []

## Caminhos das cenas principais
const BATALHA = "res://scenes/battle/battle_scene.tscn"
const DRAFT = "res://scenes/draft.tscn"
var inimigo_base_path = "res://data/enemies/apagador.tres"

## Lista de inimigos das batalhas da run
var inimigos_da_batalha: Array = []

## Inicia uma nova run (ex: ao clicar em “Novo Jogo”)
func iniciar_run():
	numero_da_batalha = 0
	doms_coletados.clear()
	iniciar_proxima_batalha()

## Vai para a próxima batalha (com base no número da batalha)
func iniciar_proxima_batalha():
	numero_da_batalha += 1
	print("Iniciando batalha", numero_da_batalha)

	inimigos_da_batalha.clear()

	var caminho_base = "res://data/enemies/apagador.tres"

	var qtd_inimigos = min(1 + numero_da_batalha, 3)  # Até 3 inimigos
	for i in range(qtd_inimigos):
		var dados = load(caminho_base)
		if dados is EnemyData:
			# Faz uma cópia e adiciona ao array tipado corretamente
			inimigos_da_batalha.append(dados.duplicate())

	get_tree().change_scene_to_file(BATALHA)


## Após vencer, vai para o draft
func ir_para_draft():
	print("Indo para cena de draft...")
	get_tree().change_scene_to_file(DRAFT)

## Guarda o dom escolhido
func coletar_dom(dom_data):
	doms_coletados.append(dom_data)
