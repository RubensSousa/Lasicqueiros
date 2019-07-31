extends Node2D

func _on_Menu_pressed():
	get_node("Anim").play("Hide")
	#yield(get_node("Anim"), "finished")
	
	trocadetelas.fade_to("res://Scenas/menu.tscn")
	trocadetelas.clear_above()
	

func _on_Reiniciar_pressed():
	get_node("Anim").play("Hide")
	#yield(get_node("Anim"), "finished")
	
	trocadetelas.fade_to("res://Scenas/Jogo.tscn")
	Global.bloqMovi = 0
	trocadetelas.clear_above()


func _on_Retorna_pressed():
	get_node("Anim").play("Hide")
	#yield(get_node("Anim"), "finished")
	
	trocadetelas.clear_above()
