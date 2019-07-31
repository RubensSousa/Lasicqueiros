extends CanvasLayer

var proxima_cena
var above_node

func fade_to(path):
	proxima_cena = path
	get_node("Anim").play("fade")

func change_scene():
	if proxima_cena != null:
		get_tree().change_scene(proxima_cena)
		
func put_above(path):
	if above_node == null:
		get_tree().set_pause(true)
		above_node = load(path).instance()
		get_tree().get_root().add_child(above_node)
		
func clear_above():
	if above_node != null:
		get_tree().set_pause(false)
		get_tree().get_root().remove_child(above_node)
		above_node = null
