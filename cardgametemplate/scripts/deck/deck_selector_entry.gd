extends Control

@export var nome_reino: String
@export var icone: Texture
@export var pasta_dos_dados: String  # Ex: "res://scripts/cards/data/firi"

signal deck_selecionado(nome_reino: String)

@onready var botao = $TextureButton
@onready var label = $TextureButton/NomeReino

func _ready():
	botao.texture_normal = icone
	label.text = nome_reino
	botao.connect("pressed", _on_pressed)

func _on_pressed():
	emit_signal("deck_selecionado", nome_reino)
