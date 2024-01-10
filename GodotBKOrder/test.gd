extends ItemList

@onready var popup : Window = $Window
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in 12:
		add_item("item:"+str(i), null, true)
	pass


func _on_item_activated(index: int) -> void:
	$Window/VBoxContainer/LineEdit.text = get_item_text(index)
	$Window/VBoxContainer/HBoxContainer/Label2.text = str(index)
	popup.show()
	


func _on_window_close_requested() -> void:
	popup.hide()


func _on_button_pressed() -> void:
	var index = int($Window/VBoxContainer/HBoxContainer/Label2.text)
	set_item_text(index, $Window/VBoxContainer/LineEdit.text)
	popup.hide()
