extends Node

var estrelas = Global.estrelas
var pontuacao = Global.pontuacao
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
var espacoFaixa = Vector2()
var faixa1 = Vector2()
var faixa2 = Vector2()
var posicaoDePuxada = Vector2()
var diferenca
var animacao
var puxar = false
var percentualErro
var body

func _ready():
 	
	set_process(true)
	rodadas
	estrelas
	velocidade
	pontuacao
#	formula()
	
	get_node("Controles/Control1/estrelas").set_text(str(estrelas))
	get_node("Controles/Control2/pontucao").set_text(str(pontuacao))
	
	if Global.VaqueiroSelect == "Canhoto":
		get_node("Vaqueiro").set_position(Vector2(500, 385))
		get_node("Vaqueiro/Sprite_animado").set_animation("Paradofrente")
		get_node("batisteiro").set_position(Vector2(420, 700))
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
	
func _process(delta):
	posicaoBoi = get_node("boi").get_position()
	posicaoVaqueiro = get_node("Vaqueiro").get_position()
	posicaoBatisteiro = get_node("batisteiro").get_position()
#	espacoFaixa = get_node("BackAnim/DetectarPontos/espaçofaixa").get_position()
	faixa1 = get_node("BackAnim/faixa1").get_position()
	faixa2 = get_node("BackAnim/faixa2").get_position()

	if Global.levelJogo == 1:
		percentualErro = 0.15#/Global.rodadas
	if Global.levelJogo == 2:
		percentualErro = 0.10#/Global.rodadas
		velocidade = Global.velocidade+100
	if Global.levelJogo == 3:
		percentualErro = 0.5#/Global.rodadas
		velocidade = Global.velocidade+200
	
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
		jogando = 0
		posicaoDePuxada.x = posicaoBoi.x + 1430.347186 #Fórmula para deixar os valores coerentes para a fórmula da pontuação
		
	#print("Faixa1=",faixa1.x)
	#print("Faixa2=",faixa2.x)
	print("PercentualErro=",percentualErro)
	print("Inicio=",faixa1.x * (1-percentualErro))
	print("Fim=",faixa2.x * (1+percentualErro))
	print("PosPuxada.x=",posicaoDePuxada.x)
	
	if(faixa1.x * (1-percentualErro) < posicaoDePuxada.x) and (posicaoDePuxada.x < faixa2.x * (1+percentualErro)):# and posicaoDePuxada.x < faixa1.x * (1-percentualErro):
		pontuar = true
	print("Pontuar=",pontuar)
	if pontuar == true and tempo <= 0:
		pontuar()
	elif (pontuar == false and tempo <= 0) or posicaoDePuxada.x >= faixa2.x:
		nao_pontuar()
		
func puxandoCaido():
	posicaoBoi = get_node("boi").get_position()
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
		if ( Global.rodadas <= 3):
			Global.pontuacao += 10
		else: 
			Global.pontuacao += 5
		
		get_node("Controles/Control1/estrelas").set_text(str(Global.estrelas))
		#get_node("Controles/Control2/pontuacao").set_text(str(Global.pontuacao))
		get_node("Controles/Control/contagem").set_text("Valeu Boi!")
		get_node("Sons/SomValeuBoi").play()
		print("Estrelas:",Global.estrelas)
		print("Rodadas:", Global.rodadas)
		print("Pontuacao:",Global.pontuacao)
#		var posicaoFaixa = get_node("DetectarPontos").get_position()
		#print(Vector2())
		
		if Global.estrelas <= 3:
			trocadetelas.put_above("res://Scenas/proxima.tscn")
			Global.rodadas += 1
		else:
				trocadetelas.put_above("res://Scenas/telaMudaNível.tscn")
				Global.estrelas = 0
				Global.levelJogo += 1
				Global.rodadas = 1
		salvarPontuacao()	

func nao_pontuar():
		Global.pontuacao -= 10
		
		get_node("Controles/Control/contagem").set_text("Zero!")
		get_node("Sons/SomZero").play() 
		
		if ( Global.pontuacao <= 0):
			trocadetelas.put_above("res://Scenas/telaDerrota.tscn")
			Global.estrelas = 0
			Global.levelJogo = 1
			Global.rodadas = 1
			Global.pontuacao = 30
		else:
			trocadetelas.put_above("res://Scenas/proxima.tscn")
			Global.rodadas += 1
		print("Rodadas:", Global.rodadas)
		print("Estrelas:",Global.estrelas)
		print("Pontuacao:",Global.pontuacao)
		print("Nivel",Global.levelJogo)
		salvarPontuacao()
		

func salvarPontuacao():
		print("Salvar Pontuacao")

func _on_DetectarPontos_body_entered(body):
	if body.get_name() == "boi":
		#posicaoDePuxada = posicaoBoi
		print (body.get_name ())
		pontuar = true
		print (pontuar)

func _on_DetectarPontos_body_exited(body):
		if body.get_name() == "boi": #or posicaoDePuxada > faixa2.x:
			print (body.get_name ())
			pontuar = false
			print (pontuar)
			if pontuar == false and puxar == false:
				nao_pontuar()


#func _on_HTTPRequest_request_completed( result, response_code, headers, body ):
