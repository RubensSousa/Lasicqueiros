extends Node2D

var id1 = str("")
var nome1 = str("")
var pontuacao1 = str("")
var data1 = str("")

func _ready():
	
	if Global.nome != null and Global.estrelas != 0:
		get_node("scores/NomeVaqueiro").set_text(str(Global.nome))
		get_node("scores/NumEstrela").set_text(str(Global.estrelas))
	
#print ('Vaqueiro',nome)
#func _on_atualizar_pressed():
#	$HTTPRequestInsert.request('http://localhost/vaquejada/vaquejada.php?type=1&nome=erialdo&pontuacao=1000&data=2019-06-13%20:49:00&id=100')

func _on_mostrar_pressed():
	$HTTPRequestView.request('http://localhost/vaquejada/vaquejada.php?type=2&id=2'+(str(Global.nome)))

#func _on_HTTPRequestInsert_request_completed( result, response_code, headers, body ):
#	var json = JSON.parse(body.get_string_from_utf8())

func _on_HTTPRequestView_request_completed( result, response_code, headers, body ):
	var json = JSON.parse(body.get_string_from_utf8())
	var resultado = (json.get_result())
	print(resultado)
	#Vaqueiro1:
	get_node("posicao1/id").set_text(str(resultado[1].id))
	get_node("posicao1/nome").set_text(str(resultado[1].nome))
	get_node("posicao1/pontuacao").set_text(str(resultado[1].pontuacao))
	get_node("posicao1/data").set_text(str(resultado[1].data))
	
	#Vaqueiro2:
	get_node("posicao1/id").set_text(str(resultado[2].id))
	get_node("posicao1/nome").set_text(str(resultado[2].nome))
	get_node("posicao1/pontuacao").set_text(str(resultado[2].pontuacao))
	get_node("posicao1/data").set_text(str(resultado[2].data))
	
	#Vaqueiro3:
	get_node("posicao1/id").set_text(str(resultado[3].id))
	get_node("posicao1/nome").set_text(str(resultado[3].nome))
	get_node("posicao1/pontuacao").set_text(str(resultado[3].pontuacao))
	get_node("posicao1/data").set_text(str(resultado[3].data))

	#Vaqueiro4:
	get_node("posicao1/id").set_text(str(resultado[4].id))
	get_node("posicao1/nome").set_text(str(resultado[4].nome))
	get_node("posicao1/pontuacao").set_text(str(resultado[4].pontuacao))
	get_node("posicao1/data").set_text(str(resultado[4].data))
	
	#Vaqueiro5:
	get_node("posicao1/id").set_text(str(resultado[5].id))
	get_node("posicao1/nome").set_text(str(resultado[5].nome))
	get_node("posicao1/pontuacao").set_text(str(resultado[5].pontuacao))
	get_node("posicao1/data").set_text(str(resultado[5].data))
#func ver_ranking():
#	get_node("posicao1/id").set_text("")

func _on_Retorna_pressed():
	trocadetelas.clear_above()