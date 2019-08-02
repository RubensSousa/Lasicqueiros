extends Node

var velocidade = 200
var posicaoBatisteiro = Vector2()
var posicaoVaqueiro = Vector2()
var andando = (true)

func _ready():
	set_process(true)
	get_node("Correndo").play()
	get_node("batisteiro/Sprite_animado").set_animation("andando")
	get_node("Vaqueiro/Sprite_animado").set_animation("andando")
	get_node("Vaqueiro/Sprite_animado").set_flip_h(true)


func _process(delta):
#	posicaoVaqueiro = get_node("Vaqueiro").get_position()
#	posicaoBatisteiro = get_node("batisteiro").get_position()
#	print(posicaoVaqueiro, posicaoBatisteiro)

	if andando == (true):
		get_node("Vaqueiro").move_and_collide(Vector2(-velocidade * delta,0))
		get_node("batisteiro").move_and_collide(Vector2(velocidade * delta,0))
#		get_node("Correndo").play()
		
func _on_Timer_timeout():
	if Global.nome == str(null):
		trocadetelas.fade_to("res://Scenas/TelaNome_2.tscn")
	else:
		trocadetelas.fade_to("res://Scenas/TelaNome.tscn")

func _on_Pular_pressed():
	if Global.nome == str(null):
		trocadetelas.fade_to("res://Scenas/TelaNome_2.tscn")
	else:
		trocadetelas.fade_to("res://Scenas/TelaNome.tscn")

func _on_Area2D_body_enter( body ):

	andando = (false)
	get_node("batisteiro/Sprite_animado").set_animation("Paradofrente")
	get_node("Vaqueiro/Sprite_animado").set_animation("Paradofrente")
	get_node("AnimIntro").play("Introducao")

