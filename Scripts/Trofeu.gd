extends Node2D

func _ready():
	if Global.estrelas == 3:
		get_node("Trofeu 2").set_texture(load("res://Sprits/TrofeuAmador.png"))
	elif Global.estrelas == 6:
		get_node("Trofeu 2").set_texture(load("res://Sprits/TrofeuIntermediario.png"))
	elif Global.estrelas == 9:
		get_node("Trofeu 2").set_texture(load("res://Sprits/TrofeuCampeao.png"))
