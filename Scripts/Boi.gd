extends KinematicBody2D

var movimento = -200 
var velocidade = Global.velocidade
var animacao
var jogando = 0
var tempo
var bloqMovi 

func _ready():
	set_process(true)
	animacao = get_node("boiAnim")

func _on_jogar_pressed():
	tempo = 5
	get_node("TempoBoi").start()
	_on_TempoBoi_timeout()

func _on_TempoBoi_timeout():
	tempo -= 1
	if tempo == 0:
		jogando = 1

func _process(delta):
	bloqMovi = Global.bloqMovi
	
	if Input.is_action_pressed("Cima") and jogando == 1 and tempo <= 0 and bloqMovi == 0:
		move_and_collide(Vector2(0,movimento) * delta)

	if Input.is_action_pressed("Baixo") and jogando == 1 and tempo <= 0 and bloqMovi == 0:
		move_and_collide(Vector2(0,-movimento) * delta)

	if Input.is_action_pressed("Jogar"):
		_on_jogar_pressed()
#	if Input.is_action_pressed("puxar"):
#		_on_puxar_pressed()




