extends DomEffect

class_name KravEffect

func executar (card, board_state) -> void:
	# O Dom ainda não executa a lógica,
	# Mas isso aqui garante que o jogo não quebre.
	print("Krav entrou em campo.")
