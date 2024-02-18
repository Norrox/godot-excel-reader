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


func _on_btn_empty_row_pressed():
		if hasData:
			var p = get_parent().get_parent().get_parent()
			p.summaTotal -= sum
			clearData()
			hasData = false
			p.get_node("leSumma").text = str(p.summaTotal) + " kr"
