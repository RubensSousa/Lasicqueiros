extends CanvasLayer

func _ready():
	pass

func _on_atualizar_pressed():
	$HTTPRequestInsert.request('http://localhost/vaquejada/vaquejada.php?type=1&nome=erialdo&pontuacao=1000&data=2019-06-13%20:49:00&id=100')

func _on_mostrar_pressed():
	$HTTPRequestView.request('http://localhost/vaquejada/vaquejada.php?type=2&id=2')

func _on_HTTPRequestUpdate_request_completed( result, response_code, headers, body ):
	var json = JSON.parse(body.get_string_from_utf8())

func _on_HTTPRequestView_request_completed( result, response_code, headers, body ):
	var json = JSON.parse(body.get_string_from_utf8())
	var resultado = (json.get_result())
	print(resultado)
