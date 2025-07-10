# TooltipManager.gd
extends Node

var tooltip_ui: Control

func inicializar(ui_ref):
	tooltip_ui = ui_ref

func mostrar(texto: String):
	if tooltip_ui:
		tooltip_ui.mostrar(texto)

func ocultar():
	if tooltip_ui:
		tooltip_ui.ocultar()
