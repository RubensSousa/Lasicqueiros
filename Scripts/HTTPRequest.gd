extends HTTPRequest

func _ready():
	HTTPRequest.request('http://localhost/vaquejada/vaquejada.php?type=2&id=2', PoolStringArray([]),false)

func _on_HTTPRequest_request_completed( result, response_code, headers, body ):
    var json = json.parse(body.get_string_from_utf8())
    print(json.result)
