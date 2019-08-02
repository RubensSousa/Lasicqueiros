extends CollisionShape2D

var position = get_position()

func _ready():
	set_process(true)
	
func process(delta):
	print(position)

