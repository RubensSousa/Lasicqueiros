extends Node2D

func _ready():
	get_node("PainelStatus/NomeVaqueiro").set_text(str(Global.nome))
	get_node("PainelStatus/NumEstrela").set_text(str(Global.estrelas))
	
	if Global.estrelas >= 3 and Global.estrelas < 6:
		if Global.estrelas == 3:
			get_node("Trofeu/Anim").play("TrofeuAnim")
			yield(get_node("Trofeu/Anim"), "finished")
		Global.trofeu = str("res://Sprits/TrofeuAmador.png")
		Global.classificacao = str("res://Sprits/FraseAmador.png")
		Global.levelJogo = 2
		 
	elif Global.estrelas >= 6 and Global.estrelas < 9:
		if Global.estrelas == 6:
			get_node("Trofeu/Anim").play("TrofeuAnim")
			yield(get_node("Trofeu/Anim"), "finished")
		Global.trofeu = str("res://Sprits/TrofeuIntermediario.png")
		Global.classificacao = str("res://Sprits/FraseIntermediario.png")
		Global.levelJogo = 3
		
	elif Global.estrelas == 9:
		if Global.estrelas == 9:
			get_node("Trofeu/Anim").play("TrofeuAnim")
			yield(get_node("Trofeu/Anim"), "finished")
		Global.trofeu = str("res://Sprits/TrofeuCampeao.png")
		Global.classificacao = str("res://Sprits/FraseProfissional.png")
	else:
		Global.levelJogo = 1
		Global.trofeu = str("")
		Global.classificacao = str("res://Sprits/FraseAspirante.png")
		
	get_node("PainelStatus/Trofeu").set_texture(load(Global.trofeu))
	get_node("PainelStatus/Classe").set_texture(load(Global.classificacao))
	
func _on_jogar_pressed():
	Global.bloqMovi = 0
	trocadetelas.fade_to("res://Scenas/Jogo.tscn")
	
func _on_som_pressed():
	if Global.mudo == false:
		Global.mudo = true
		get_node("Control/som/Sprite").set_texture(load("res://Sprits/botoes/SomMudo.png"))
		get_node("SomDeFundo").stop()
	else:
		get_node("SomDeFundo").play()
		Global.mudo = false
		get_node("Control/som/Sprite").set_texture(load("res://Sprits/botoes/Som.png"))

func _on_VaqueiroSelect_pressed():
	trocadetelas.put_above("res://Scenas/VaqueiroSelect.tscn")

func _on_Nivel_pressed():
	trocadetelas.put_above("res://Scenas/EscolhaLevel.tscn")

func _on_Tutorial_pressed():
	trocadetelas.put_above("res://Scenas/Tutorial.tscn")

func _on_Informacoes_pressed():
	trocadetelas.put_above("res://Scenas/informacoes.tscn")

func _on_Scores_pressed():
	trocadetelas.put_above("res://Scenas/ranking.tscn")
	
func _on_Sair_pressed():
	get_tree().quit()