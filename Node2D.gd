extends Node2D

var excel
var workbook
var sheet
var table_data
var summaTotal : float = 0

func _ready():
	excel = ExcelFile.open_file("res://Beställningar 2023.xlsx") # Öppna xlsx-filen
	workbook = excel.get_workbook() # Hämta arbetsboken
	sheet = workbook.get_sheet(0) # Hämta det första arket
	table_data = sheet.get_table_data() # Hämta tabellens data som en array av arrayer
	#print(JSON.stringify(table_data, "\t")) # Skriv ut data i JSON-format

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_on_btn_search_pressed()

func _on_button_pressed():
	table_data = sheet.get_table_data()
	var artikelnummer = int($LineEdit.text) # Det artikelnummer du vill söka efter
	print("TEXT IN: " + str(artikelnummer))
	for row in table_data: # Loopa över varje rad i tabellen
		var column_data : Dictionary = table_data[row]
		#print(column_data)
		if column_data[1] == artikelnummer: # Om första kolumnen i raden matchar artikelnumret
			print(column_data[2]) # Skriv ut den tredje kolumnen i raden
			$Label.text = "Artikel: " + str(column_data[2]) + " Pris: " + str(column_data[3]) + "kr"
			break # Avsluta loopen
		else:
			print("No matched id")
			#break


func _on_btn_search_pressed():
	$ItemList.clear()
	table_data = sheet.get_table_data()
	var partial_key = $leSEARCH.text
	for row in table_data:
		var column_data : Dictionary = table_data[row]
		if column_data.has(2):
			#print(column_data[2]) #Printar allt i kolumn 2
			if partial_key in column_data[2] : # Om första kolumnen i raden matchar
				$ItemList.add_item(column_data[2])
				print(column_data[2]) # Skriv ut den tredje kolumnen i raden
		#for column in column_data:
		#	print(column_data[column])


func _on_btn_add_pressed():
	if $ItemList.get_selected_items().size() > 0:
		print($ItemList.get_item_text($ItemList.get_selected_items()[0]))
		table_data = sheet.get_table_data()
		for row in table_data:
			var column_data : Dictionary = table_data[row]
			if column_data.has(2):
				if column_data[2] == $ItemList.get_item_text($ItemList.get_selected_items()[0]):
					for child in $Panel/VBoxContainer.get_children():
						print(child.name + str(child.hasData))
						if not child.hasData:
							child.hasData = true
							if column_data.has(1):
								child.get_node("leRSK").text = str(column_data[1])
							if column_data.has(2):
								child.get_node("leArtikel").text = str(column_data[2])
								child.get_node("leAntal").text = $leAntal.text + " st/m"
							if column_data.has(6):
								child.get_node("leApris").text = str(column_data[6]) + " Kr/st"
								var sum : float = float(column_data[6]) * float($leAntal.text)
								summaTotal += sum
								child.get_node("leSum").text = str(sum) + " Kr"
								$leSumma.text = str(summaTotal) + " kr"
							break
						elif child.name == "Rad10" and child.hasData:
							print("ALL CHILDREN FILLED WITH DATA")
							break
					
					
					break
		




func _on_btn_clear_pressed() -> void:
	$Panel/VBoxContainer/Rad1.hasData = false
	$Panel/VBoxContainer/Rad2.hasData = false
	$Panel/VBoxContainer/Rad3.hasData = false
	$Panel/VBoxContainer/Rad4.hasData = false
	$Panel/VBoxContainer/Rad5.hasData = false
	$Panel/VBoxContainer/Rad6.hasData = false
	$Panel/VBoxContainer/Rad7.hasData = false
	$Panel/VBoxContainer/Rad8.hasData = false
	$Panel/VBoxContainer/Rad9.hasData = false
	$Panel/VBoxContainer/Rad10.hasData = false
	
	$Show.clear()
	summaTotal = 0
	$leSumma.text = str(summaTotal) + " kr"
