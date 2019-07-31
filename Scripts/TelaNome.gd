extends Node2D

func _ready():
	set_process(true)

func _on_BtnNao_pressed():
	get_node("AnimPergunta").play("PerguntaAnim")
	trocadetelas.fade_to("res://Scenas/menu.tscn")
	
func _on_BtnSim_pressed():
	get_node("AnimPergunta").play("PerguntaAnim")
	#yield(get_node("AnimPergunta"), "finished")
	
	trocadetelas.put_above("res://Scenas/TelaNome_2.tscn")
