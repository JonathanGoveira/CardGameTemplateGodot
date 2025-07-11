extends Control

var texto: String = ""
@onready var panel = $Panel
@onready var label = $Panel/Label

func _ready():
	hide()
	set_process_input(true)

func mostrar(novo_texto: String):
	texto = novo_texto
	label.text = texto
	show()

func ocultar():
	hide()

func _process(_delta):
	if visible:
		global_position = get_global_mouse_position() + Vector2(16, 16)
