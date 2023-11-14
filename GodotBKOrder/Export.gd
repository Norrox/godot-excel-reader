extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	await RenderingServer.frame_post_draw
	$SubViewportContainer/SubViewport.get_texture().get_image().save_png("res://Screenshot2222.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	OS.execute("mspaint", ["/pt", "file.png"])
	
	get_parent().queue_free()
