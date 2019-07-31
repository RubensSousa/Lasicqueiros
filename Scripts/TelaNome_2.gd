extends Node2D

var nome

func _ready():
	set_process(true)

func _process(delta):
	get_node("Nome").get_text()

func _on_BtnSeguir_pressed():
	var nome = get_node("Nome").get_text()
	print(nome)
	Global.nome = nome
	print("Global", Global.nome)
	get_node("AnimNome").play("NomeAnim_2")
	yield(get_node("AnimNome"), "finished")
	
	trocadetelas.fade_to("res://Scenas/menu.tscn")
	trocadetelas.clear_above()






