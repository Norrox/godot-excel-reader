extends Node2D

var excel
var workbook
var sheet
var table_data
var summaTotal : float = 0
var reka_nummer

var export_rsk : Array = [""]
var export_description : Array = [""]
var export_ammount : Array = [""]
var export_price : Array = [""]
var export_sum : Array = [""]
var export_slag : Array = [""]
var export_ansvar : Array = [""]
var export_verks : Array = [""]
var export_akt : Array = [""]
var export_objekt : Array = [""]
var export_projekt : Array = [""]
var export_motp : Array = [""]
var export_rekanr : Array = [""]
var export_workplace : Array = [""]
var export_handler : Array = [""]
var export_date : Array = [""]
var export_summa

func _ready():
	$AnimationPlayer.play("Bk_gunga")
	if OS.has_feature("Standalone"):
		excel = ExcelFile.open_file("./Beställning material/Beställningar/2023/Beställningar 2023.xlsx") # Öppna xlsx-filen
	else:
		excel = ExcelFile.open_file("res://Beställningar 2023.xlsx")
	workbook = excel.get_workbook() # Hämta arbetsboken
	sheet = workbook.get_sheet(0) # Hämta det första arket
	table_data = sheet.get_table_data() # Hämta tabellens data som en array av arrayer
	$lbReka.text = readData()
	$leDate.text = str(Time.get_datetime_dict_from_system().year) +"-"+ str(Time.get_datetime_dict_from_system().month) +"-"+ str(Time.get_datetime_dict_from_system().day)
	initArrays()
	
	
	

func initArrays():
	export_rsk.resize(20)
	export_description.resize(20)
	export_ammount.resize(20)
	export_price.resize(20)
	export_sum.resize(20)
	export_slag.resize(20)
	export_ansvar.resize(20)
	export_verks.resize(20)
	export_akt.resize(20)
	export_objekt.resize(20)
	export_projekt.resize(20)
	export_motp.resize(20)
	export_rekanr.resize(20)
	export_workplace.resize(20)
	export_handler.resize(20)
	export_date.resize(20)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_on_btn_search_pressed()
		
func _on_button_pressed():
	table_data = sheet.get_table_data()
	var artikelnummer = int($LineEdit.text) # Det artikelnummer du vill söka efter
	for row in table_data: # Loopa över varje rad i tabellen
		var column_data : Dictionary = table_data[row]
		#print(column_data)
		if column_data[1] == artikelnummer: # Om första kolumnen i raden matchar artikelnumret
			$Label.text = "Artikel: " + str(column_data[2]) + " Pris: " + str(column_data[3]) + "kr"
			break # Avsluta loopen
		else:
			print("No matched id")
			#break
func _on_btn_search_pressed():
	$ItemList.clear()
	table_data = sheet.get_table_data()
	var partial_key : String = $leSEARCH.text
	var partial_key_storbokstav : String = partial_key.capitalize()
	var partial_key_litenbokstav : String = partial_key.capitalize().to_lower()
	for row in table_data:
		var column_data : Dictionary = table_data[row]
		if column_data.has(2):
			#print(column_data[2]) #Printar allt i kolumn 2
			if partial_key_storbokstav in column_data[2] : # Om första kolumnen i raden matchar med stor bokstav
				$ItemList.add_item(column_data[2])
			elif partial_key_litenbokstav in column_data[2] : # Om första kolumnen i raden matchar med liten bokstav
				$ItemList.add_item(column_data[2])
		#for column in column_data:
		#	print(column_data[column])

func _on_btn_add_pressed():
	if $ItemList.get_selected_items().size() > 0:
		table_data = sheet.get_table_data()
		for row in table_data:
			var column_data : Dictionary = table_data[row]
			if column_data.has(2):
				if column_data[2] == $ItemList.get_item_text($ItemList.get_selected_items()[0]):
					for child in $Panel/VBoxContainer.get_children():
						if not child.hasData:
							child.hasData = true
							if column_data.has(1):
								child.get_node("leRSK").text = str(column_data[1])
							if column_data.has(2):
								child.get_node("leArtikel").text = str(column_data[2])
								child.get_node("leAntal").text = $leAntal.text
							if column_data.has(6):
								child.get_node("leApris").text = str(column_data[6])
								var sum : float = float(column_data[6]) * float($leAntal.text)
								summaTotal += sum
								child.get_node("leSum").text = str(sum) + " Kr"
								$leSumma.text = str(summaTotal) + " kr"
							break
						elif child.name == "Rad20" and child.hasData:
							print("ALL CHILDREN FILLED WITH DATA")
							break
					break

func _on_btn_clear_pressed() -> void:
	for child in $Panel/VBoxContainer.get_children():
		child.clearData()
		child.hasData = false
	
	summaTotal = 0
	$leSumma.text = str(summaTotal) + " kr"

func readData() -> String:
	# Read the JSON file
	
	var f = FileAccess.open("./data.json", FileAccess.READ)
	var json = JSON.parse_string(f.get_as_text())
	print("FILE READ JSON=" + str(json))
	f.close()
	var dat = json["rekanr"]
	dat += 1
	var ret = ""
	if dat < 10:
		ret = "0000"+str(dat)
	elif dat < 100:
		ret = "000"+str(dat)
	elif dat < 1000:
		ret = "00"+str(dat)
	elif dat < 10000:
		ret = "0"+str(dat)
	else:
		ret = str(dat)
	
	reka_nummer = dat
	print("NEW NUMB=" + str(reka_nummer))
	return ret

func writeData() -> void:
	# Create a JSON object
	print("SKRIVER JSON=" + str(reka_nummer))
	var json = {
		"rekanr": reka_nummer
	}
	
	var f = FileAccess.open("./data.json", FileAccess.WRITE)
	f.store_string(JSON.stringify(json))
	#f.open("rekanr.json", File.WRITE)
	#f.store_string(JSON.print(json))
	f.close()


func _on_btn_export_pressed() -> void:
	collectData()
	writeData()
	var popup = Popup.new()
	add_child(popup)
	var exportscene = load("res://Export.tscn").instantiate()
	exportscene.import_rsk = export_rsk
	exportscene.import_description = export_description
	exportscene.import_ammount = export_ammount
	exportscene.import_price = export_price
	exportscene.import_sum = export_sum
	exportscene.import_slag = export_slag
	exportscene.import_ansvar = export_ansvar
	exportscene.import_verks = export_verks
	exportscene.import_akt = export_akt
	exportscene.import_objekt = export_objekt
	exportscene.import_projekt = export_projekt
	exportscene.import_motp = export_motp
	exportscene.import_rekanr = export_rekanr
	exportscene.import_workplace = export_workplace
	exportscene.import_handler = export_handler
	exportscene.import_date = export_date
	exportscene.import_summa = export_summa
	exportscene.updatePicture()
	popup.add_child(exportscene)
	popup.popup(Rect2i(0,0,1600,1029))
	$lbReka.text = readData()
	#popup.hide()

func collectData():
	var i = 0
	for child in $Panel/VBoxContainer.get_children():
		export_rsk[i] = child.get_node("leRSK").text
		export_description[i] = child.get_node("leArtikel").text
		export_ammount[i] = child.get_node("leAntal").text
		export_price[i] = child.get_node("leApris").text
		export_sum[i] = child.get_node("leSum").text
		export_slag[i] = child.get_node("leSlag").text
		export_ansvar[i] = child.get_node("leAnsvar").text
		export_verks[i] = child.get_node("leVerks").text
		export_akt[i] = child.get_node("leAkt").text
		export_objekt[i] = child.get_node("leObjekt").text
		export_projekt[i] = child.get_node("leProjekt").text
		export_motp[i] = child.get_node("leMotp").text
		export_rekanr[i] = $lbReka.text
		export_workplace[i] = $leArbersplats.text
		export_handler[i] = $"leHandläggare".text
		export_date[i] = $leDate.text
		export_summa = $leSumma.text
		i+=1
	pass

