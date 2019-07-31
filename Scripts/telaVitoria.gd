extends Node2D

var estrelas = Global.estrelas

func _ready():

	if estrelas == 1:
		get_node("Estrela1").set_texture(load("res://Sprits/botoes/estrela_AC.png"))
	elif estrelas == 2:
		get_node("Estrela1").set_texture(load("res://Sprits/botoes/estrela_AC.png"))
		get_node("Estrela2").set_texture(load("res://Sprits/botoes/estrela_AC.png"))
	elif estrelas == 3:
		get_node("Estrela1").set_texture(load("res://Sprits/botoes/estrela_AC.png"))
		get_node("Estrela2").set_texture(load("res://Sprits/botoes/estrela_AC.png"))
		get_node("Estrela3").set_texture(load("res://Sprits/botoes/estrela_AC.png"))

func _on_Menu_pressed():
	get_node("Anim").play("Hide")
	yield(get_node("Anim"), "finished")
	
	trocadetelas.fade_to("res://Scenas/menu.tscn")
	trocadetelas.clear_above()


func _on_Reiniciar_pressed():
	Global.estrelas = 0
	Global.rodadas = 0
	get_node("Anim").play("Hide")
	yield(get_node("Anim"), "finished")
	
	trocadetelas.fade_to("res://Scenas/Jogo.tscn")
	Global.bloqMovi = 0
	trocadetelas.clear_above()


func _on_proxNivel_pressed():
	get_node("Anim").play("Hide")
	yield(get_node("Anim"), "finished")
	
	trocadetelas.fade_to("res://Scenas/menu.tscn")
	trocadetelas.clear_above()

