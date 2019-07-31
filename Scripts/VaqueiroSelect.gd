extends Node2D

var press = "00ff1b"
var noPress = "ffffff"

func _ready():
	set_process(true)
	
func _process(delta):
	if Global.VaqueiroSelect == "Destro" and Global.VaqueiroSelect != "Canhoto":
		get_node("Destro/Sprite").set_modulate(str(press))
	if Global.VaqueiroSelect == "Canhoto" and Global.VaqueiroSelect != "Destro":
		get_node("Canhoto/Sprite").set_modulate(str(press))

func _on_Retorna_pressed():
	trocadetelas.clear_above()

func _on_Destro_pressed():
	Global.VaqueiroSelect = "Destro"
	get_node("Canhoto/Sprite").set_modulate(str(noPress))
#	trocadetelas.clear_above()

func _on_Canhoto_pressed():
	Global.VaqueiroSelect = "Canhoto"
	get_node("Destro/Sprite").set_modulate(str(noPress))
#	trocadetelas.clear_above()

