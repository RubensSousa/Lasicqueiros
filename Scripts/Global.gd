extends Node

var movimento = -200
var bloqMovi = 0
var mudo = false
var VaqueiroSelect = str("Canhoto") 
var AtualLevel = 1
var levelJogo = 1
var velocidade = 100
var nome = str("")
var estrelas = 0
var rodadas = 0
var trofeu = str("")
var classificacao = str("")

#func get_velocidade():
#	print("AtualLevel=",AtualLevel)
#	if AtualLevel == 1:
#		velocidade = rand_range(1000,2000)
#		print("velocidade=",velocidade)
	#elif Global.AtualLevel == 2:
	#	Global.velocidade = randi_range(1000,1200)
	#elif Global.AtualLevel == 3:
	#	Global.velocidade = randi_range(1300,1500)
	#print("Global.velocidade",velocidade)

var savefile = File.new()
var savepath = "user://savegame.save"
var savedata = {"level1": 0,
				"level2": -1,
				"level3": -2}

func _ready():
#	print("Global", bloqMovi)
#	print(VaqueiroSelect)
	if not savefile.file_exists(savepath):
		save()
	read()

func save():
	savefile.open(savepath, File.WRITE)
	savefile.store_var(savedata)
	savefile.close()

func read():
	savefile.open(savepath, File.READ)
	savedata = savefile.get_var()
	savefile.close()

func save_level(level, stars):
	if level > 3: return 
	savedata["level" + str(level)] = stars
	save()
