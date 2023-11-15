extends Node2D

var import_rsk : Array = [""]
var import_description : Array = [""]
var import_ammount : Array = [""]
var import_price : Array = [""]
var import_sum : Array = [""]
var import_slag : Array = [""]
var import_ansvar : Array = [""]
var import_verks : Array = [""]
var import_akt : Array = [""]
var import_objekt : Array = [""]
var import_projekt : Array = [""]
var import_motp : Array = [""]
var import_rekanr : Array = [""]
var import_workplace : Array = [""]
var import_handler : Array = [""]
var import_date : Array = [""]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initArrays()

func initArrays():
	import_rsk.resize(20)
	import_description.resize(20)
	import_ammount.resize(20)
	import_price.resize(20)
	import_sum.resize(20)
	import_slag.resize(20)
	import_ansvar.resize(20)
	import_verks.resize(20)
	import_akt.resize(20)
	import_objekt.resize(20)
	import_projekt.resize(20)
	import_motp.resize(20)
	import_rekanr.resize(20)
	import_workplace.resize(20)
	import_handler.resize(20)
	import_date.resize(20)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	await RenderingServer.frame_post_draw
	$SubViewportContainer/SubViewport.get_texture().get_image().save_png("res://Förrådsreka_"+str(import_rekanr[0])+".png")
	OS.execute("mspaint", ["/pt", "Förrådsreka_"+str(import_rekanr[0])+".png", ""])
	get_parent().queue_free()
	
func updatePicture():
	var i = 0
	for child in $SubViewportContainer/SubViewport/Panel/VBoxContainer.get_children():
		child.get_node("leRSK").text = import_rsk[i] 
		child.get_node("leArtikel").text = import_description[i]
		child.get_node("leAntal").text = import_ammount[i]
		child.get_node("leApris").text = import_price[i]
		child.get_node("leSum").text = import_sum[i]
		child.get_node("leSlag").text = import_slag[i]
		child.get_node("leAnsvar").text = import_ansvar[i]
		child.get_node("leVerks").text = import_verks[i]
		child.get_node("leAkt").text = import_akt[i]
		child.get_node("leObjekt").text = import_objekt[i]
		child.get_node("leProjekt").text = import_projekt[i]
		child.get_node("leMotp").text = import_motp[i]
		#import_rekanr[i] = $lbReka.text
		#import_workplace[i] = $leArbersplats.text
		#import_handler[i] = $"leHandläggare".text
		#import_date[i] = $leDate.text

		i+=1
