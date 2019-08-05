extends Node2D

var press = "00ff1b"
var noPress = "ffffff"


func _ready():
	set_process(true)

func _process(delta):
	if Global.levelJogo == 1 and Global.levelJogo != 2 and Global.levelJogo != 3:
		get_node("Level1/numero").set_modulate(str(press))
		get_node("Level2/numero").set_modulate(str(noPress))
		get_node("Level3/numero").set_modulate(str(noPress))
	if Global.levelJogo == 2 and Global.levelJogo != 1 and Global.levelJogo != 3:
		get_node("Level2/numero").set_modulate(str(press))
		get_node("Level1/numero").set_modulate(str(noPress))
		get_node("Level3/numero").set_modulate(str(noPress))
	if Global.levelJogo == 3 and Global.levelJogo != 1 and Global.levelJogo != 2:
		get_node("Level3/numero").set_modulate(str(press))
		get_node("Level2/numero").set_modulate(str(noPress))
		get_node("Level1/numero").set_modulate(str(noPress))

func _on_Retorna_pressed():
	trocadetelas.clear_above()

