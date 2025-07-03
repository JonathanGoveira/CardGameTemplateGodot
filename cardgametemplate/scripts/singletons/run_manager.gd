extends Node

## Número da batalha atual
var numero_da_batalha: int = 0

## Lista de Doms coletados na run (pode ser atualizado com dados reais depois)
var doms_coletados: Array = []

## Caminhos das cenas principais
const BATALHA = "res://scenes/battle/battle_scene.tscn"
const DRAFT = "res://scenes/draft.tscn"
## Inicia uma nova run (ex: ao clicar em “Novo Jogo”)
func iniciar_run():
	numero_da_batalha = 0
	doms_coletados.clear()
	iniciar_proxima_batalha()

## Vai para a próxima batalha (com base no número da batalha)
func iniciar_proxima_batalha():
	numero_da_batalha += 1
	print("Iniciando batalha", numero_da_batalha)
	get_tree().change_scene_to_file(BATALHA)

## Após vencer, vai para o draft
func ir_para_draft():
	print("Indo para cena de draft...")
	get_tree().change_scene_to_file(DRAFT)

## Guarda o dom escolhido
func coletar_dom(dom_data):
	doms_coletados.append(dom_data)
