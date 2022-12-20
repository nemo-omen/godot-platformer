extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _on_Player_peek(direction):
	if direction == "up":
		if offset.y >= -160:
			offset.y -= 20.0
	elif direction == "down":
		if offset.y <= 160:
			offset.y += 20.0
	elif direction == "left":
		if offset.x >= -160:
			offset.x -= 20.0
	elif direction == "right":
		if offset.x <= 160:
			offset.x += 20.0

func _on_Player_camreset():
	if offset.y <= 0:
		offset.y += 5
	elif offset.y >= 0:
		offset.y -= 5

	if offset.x <= 0:
		offset.x += 5
	elif offset.x >= 0:
		offset.x -= 5
