
extends TouchScreenButton

export(int) var level = 0
export(String, FILE) var estrelas1
export(String, FILE) var estrelas2
export(String, FILE) var estrelas3

var estrelas

func _ready():
		set_process(true)
#		estrelas = Global.estrelas
		estrelas = Global.savedata["level" + str(level)]
		if estrelas != -1:
			get_node("bloqueado").hide()
			if estrelas != 0:
				get_node("estrelas").show()
				
			if estrelas == 1:
				get_node("estrelas").set_texture(load(estrelas1))
			elif estrelas2 == 2:
				get_node("estrelas").set_texture(load(estrelas2))
			elif estrelas2 == 3:
				get_node("estrelas").set_texture(load(estrelas3))
				
		get_node("numero").set_texture(load ("res://Sprits/botoes/Num_" + str(level) +".png"))
		

func _on_Level_pressed():
	if estrelas != -1:
		Global.AtualLevel = level
		print("LevelAtual", Global.AtualLevel)
		Global.levelJogo = level
		print("LevelJogo", Global.levelJogo)
#		trocadetelas.fade_to("res://Scenas/Jogo.tscn")


