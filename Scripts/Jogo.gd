extends Node

var estrelas = Global.estrelas
var rodadas = Global.rodadas
var pontuar = false
var velocidade = Global.velocidade
var movimento = -250
var jogando = 0
var tempo
var IniciarJogo = true
var posicaoBoi = Vector2()
var posicaoVaqueiro = Vector2()
var posicaoBatisteiro = Vector2()
var posicaoCerca = Vector2()
var diferenca
var animacao
var puxar = false

func _ready():
 	
	set_process(true)
	rodadas
	estrelas
	velocidade
	
	get_node("Controles/Control1/estrelas").set_text(str(estrelas))
	
	if Global.VaqueiroSelect == "Canhoto":
		get_node("Vaqueiro").set_position(Vector2(500, 385))
		get_node("Vaqueiro/Sprite_animado").set_animation("Paradofrente")
		get_node("batisteiro").set_position(Vector2(420, 550))
		get_node("batisteiro/Sprite_animado").set_animation("Paradocostas")
		get_node("boi").set_position(Vector2(290, 440))
		
		posicaoCerca = get_node("Limites/CercaBaixo").get_position()
#		print("CercaBaixo",posicaoCerca)
		
	if Global.VaqueiroSelect == "Destro":
		get_node("Vaqueiro").set_position(Vector2(420, 550))
		get_node("Vaqueiro/Sprite_animado").set_animation("Paradocostas")
		get_node("Vaqueiro").set_z(4)
		get_node("batisteiro").set_position(Vector2(500, 385))
		get_node("batisteiro/Sprite_animado").set_animation("Paradofrente")
		get_node("batisteiro").set_z(1)
		get_node("boi").set_position(Vector2(290, 440))

		posicaoCerca = get_node("Limites/cerca cima").get_position()
#		print("CercaCima",posicaoCerca)
#	print("cerca", posicaoCerca)
	#	diferensa = posicaoBoi.y - posicaoCerca.y 
#	print("diferença", diferensa)

#func _formula():
#	PosicaoFaixa1 = posicaoCerca(width)
#	posicaoFaixa2 = posicaoCerca(width)
	#valorFormula = (velocidade*posicaoBoi)/

func _process(delta):
	posicaoBoi = get_node("boi").get_position()
	posicaoVaqueiro = get_node("Vaqueiro").get_position()
	posicaoBatisteiro = get_node("batisteiro").get_position()
#	print("boi", posicaoBoi)	
#	print("Vaqueiro", posicaoVaqueiro)
#	print("Batisteiro", posicaoBatisteiro)
#	print(Global.VaqueiroSelect)
	
	#Global.get_velocidade()
	
	if jogando == 1 and tempo <=0 and Global.VaqueiroSelect == "Canhoto":
		get_node("Vaqueiro").move_and_collide(Vector2(velocidade * delta,-1.5))
		get_node("boi").move_and_collide(Vector2(velocidade * delta,-1.5))
		get_node("batisteiro").move_and_collide(Vector2(velocidade * delta,-1.5))

	if jogando == 1 and tempo <=0 and Global.VaqueiroSelect == "Destro":
		get_node("Vaqueiro").move_and_collide(Vector2(velocidade * delta,1.5))
		get_node("boi").move_and_collide(Vector2(velocidade * delta,1.5))
		get_node("batisteiro").move_and_collide(Vector2(velocidade * delta,1.5))

	if Input.is_action_pressed("Jogar") and jogando == 0:
		_on_jogar_pressed()
	if Input.is_action_pressed("puxar") and jogando == 1:
		_on_puxar_pressed()


		
func _on_puxar_pressed():
	if Global.VaqueiroSelect == "Canhoto":
		diferenca = posicaoCerca.y - posicaoBoi.y
#		print("diferença", diferenca)
	
		if jogando == 1 and diferenca <= 200:
			puxar()

	if Global.VaqueiroSelect == "Destro":
		diferenca = posicaoCerca.y - posicaoBoi.y
#		print("diferença", diferenca)
		
		if jogando == 1 and diferenca >= -150:
			puxar()

func _on_jogar_pressed():
	if jogando == 0 and IniciarJogo == true:
		jogando = 1
		#print (jogando)
		comecar()
		get_node("Sons/SomFundo").play()

func _on_pause_pressed():
	trocadetelas.put_above("res://Scenas/telaPause.tscn")

func comecar():
	IniciarJogo = false
#	print (IniciarJogo)
	get_node("Sons/SomCavalo").play()
	get_node("Sons/SomToro").play()
	get_node("comandos/jogar").hide()
	tempo = 4
	get_node("Controles/Control/contagem").set_text("")
	get_node("Iniciar").start()

func puxar():
	
	if jogando == 1 and tempo <= 0:
		get_node("BackAnim").stop()
		puxar = true
#		get_node("Vaqueiro").move_and_collide(Vector2(80,-100)) 
#		get_node("boi").move_and_collide(Vector2(100,-50)) 
		if Global.VaqueiroSelect == "Canhoto":
			get_node("Vaqueiro").set_position(Vector2(posicaoVaqueiro.x + 200 , posicaoVaqueiro.y - 200))
			get_node("boi").set_position(Vector2(posicaoBoi.x + 80 , posicaoBoi.y - 100))
			puxandoCaido()
		if Global.VaqueiroSelect == "Destro":
			get_node("Vaqueiro").set_position(Vector2(posicaoVaqueiro.x + 200 , posicaoVaqueiro.y + 200))
			get_node("boi").set_position(Vector2(posicaoBoi.x + 80 , posicaoBoi.y + 100))
			puxandoCaido()
		Global.bloqMovi = 1
#		print(Global.bloqMovi)
		jogando = 0
	
#	yield(puxar(), "finished")
	
	if pontuar == true and tempo <= 0:
		pontuar()
	elif pontuar == false and tempo <= 0:
		nao_pontuar()
		


func puxandoCaido():
	posicaoBoi = get_node("boi").get_position()
#	print(posicaoBoi)
	get_node("boi").hide()
	get_node("puxarcair").play("puxarcair")
	get_node("puxarcair/AnimatedSprite").set_position(posicaoBoi)
	get_node("Sons/SomPortao").play()
	get_node("Sons/SomToro").play()

func _on_Iniciar_timeout():
	tempo -= 1 
	if tempo >= 1:
		get_node("Controles/Control/contagem").set_text(str(tempo))

	if tempo == 0:
		get_node("Controles/Control/contagem").set_text("")
		get_node("Cabine/PortaoAnim").play("PortaoAnim")
		get_node("boisAnim").play("boisAnim")
		get_node("Sons/SomPortao").play() 
		get_node("Cabine/PortaoAnim/Sprite").hide()
		get_node("BackAnim").play("BackAnim")
		get_node("Vaqueiro/Sprite_animado").set_animation("andando")
		get_node("batisteiro/Sprite_animado").set_animation("andando")
#		get_node("Sons/SomFundo").play()
		
		if Global.VaqueiroSelect == "Canhoto":
			get_node("boi").move_and_collide(Vector2(-movimento+50,0))
		if Global.VaqueiroSelect == "Destro":
			get_node("boi").move_and_collide(Vector2(-movimento+50,50))

func pontuar():
		Global.estrelas += 1
		Global.rodadas += 1
		get_node("Controles/Control1/estrelas").set_text(str(Global.estrelas))
		print(Global.estrelas)
		get_node("Controles/Control/contagem").set_text("Valeu Boi!")
		get_node("Sons/SomValeuBoi").play()
		print("Rodadas", rodadas)

		if rodadas <= 3:
			trocadetelas.put_above("res://Scenas/proxima.tscn")
		else:
			if estrelas <= 1:
				trocadetelas.put_above("res://Scenas/telaDerrota.tscn")
			elif estrelas >= 2 :
				trocadetelas.put_above("res://Scenas/telaVitoria.tscn")

func nao_pontuar():
		Global.rodadas += 1
		get_node("Controles/Control/contagem").set_text("Zero!")
		get_node("Sons/SomZero").play() 
		print("Rodadas", rodadas)
		
		if rodadas <= 3:
			trocadetelas.put_above("res://Scenas/proxima.tscn")
		else:
			if estrelas <= 1:
				trocadetelas.put_above("res://Scenas/telaDerrota.tscn")
			elif estrelas >= 2:
				trocadetelas.put_above("res://Scenas/telaVitoria.tscn")

func _on_DetectarPontos_body_enter( body ):
	if body.get_name() == "boi":
	#	print (body.get_name ())
		pontuar = true
	#	print (pontuar)

func _on_DetectarPontos_body_exit( body ):
	if body.get_name() == "boi":
#		print (body.get_name ())
		pontuar = false
#		print (pontuar)
		if pontuar == false and puxar == (false):
			nao_pontuar()


func _on_TextureButton_pressed():
	pass # Replace with function body.
