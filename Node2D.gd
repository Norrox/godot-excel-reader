
extends Node2D

var excel
var workbook
var sheet
var table_data
# Called when the node enters the scene tree for the first time.
func _ready():
	excel = ExcelFile.open_file("res://Beställningar 2023.xlsx") # Öppna xlsx-filen
	workbook = excel.get_workbook() # Hämta arbetsboken
	sheet = workbook.get_sheet(0) # Hämta det första arket
	table_data = sheet.get_table_data() # Hämta tabellens data som en array av arrayer
	#print(JSON.stringify(table_data, "\t")) # Skriv ut data i JSON-format
#
	## Output by row and column
	#for row in table_data:
		#var column_data = table_data[row]
		#for column in column_data:
			#print(column_data[column])

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
					if column_data.has(6):
						print(str(column_data[6]) + " Kronor") # Skriv ut den tredje kolumnen i raden
					if column_data.has(1):
						print(" RSK : " + str(column_data[1]))
					break
		
