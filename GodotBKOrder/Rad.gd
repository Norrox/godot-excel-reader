extends Control

var hasData : bool = false
var id : int = 0
var sum : float = 0.0

func _ready() -> void:
	id = int(name.erase(0,3))
	$Label.text = str(id) + "."

func changeHasData(a : bool):
	hasData = a

func clearData():
	$leRSK.text = ""
	$leArtikel.text = ""
	$leAntal.text = ""
	$leApris.text = ""
	$leSum.text = ""
	$leSlag.text = ""
	$leAnsvar.text = ""
	$leVerks.text = ""
	$leAkt.text = ""
	$leObjekt.text = ""
	$leProjekt.text = ""
	$leMotp.text = ""
	sum = 0.0
