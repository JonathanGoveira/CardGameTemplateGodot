extends Control

@onready var botao_continuar = $Button

func _ready():
	botao_continuar.pressed.connect(_on_continuar_pressed)

func _on_continuar_pressed():
	print("Jogador escolheu avançar a run.")
	RunManager.iniciar_proxima_batalha()
