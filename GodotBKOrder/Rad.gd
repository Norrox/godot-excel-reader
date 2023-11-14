extends Control

var hasData : bool = false

func changeHasData(a : bool):
	hasData = a

func clearData():
	$leRSK.text = ""
	$leArtikel.text = ""
	$leAntal.text = ""
	$leApris.text = ""
	$leSum.text = ""
