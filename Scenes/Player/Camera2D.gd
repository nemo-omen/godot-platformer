extends Camera2D

const OFFSET_LIMIT = 200

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _on_Player_peek(direction):
	peek(direction)

func peek(direction):
	if direction == "up":
		if (offset.y - 20) >= -OFFSET_LIMIT:
			offset.y -= 20.0
		else:
			offset.y = -OFFSET_LIMIT
	elif direction == "down":
		if (offset.y + 20) <= OFFSET_LIMIT:
			offset.y += 20.0
		else:
			offset.y = OFFSET_LIMIT
	elif direction == "left":
		if (offset.x - 20) >= -OFFSET_LIMIT:
			offset.x -= 20.0
		else:
			offset.x = -OFFSET_LIMIT
	elif direction == "right":
		if (offset.x + 20) <= OFFSET_LIMIT:
			offset.x += 20.0
		else:
			offset.x = OFFSET_LIMIT
	elif direction == "downright":
		peek("down")
		peek("right")
	elif direction == "upright":
		peek("up")
		peek("right")
	elif direction == "downleft":
		peek("down")
		peek("left")
	elif direction == "upleft":
		peek("up")
		peek("left")

func _on_Player_camreset():
	if offset.y < 0:
		offset.y += 5
	elif offset.y > 0:
		offset.y -= 5

	if offset.x < 0:
		offset.x += 5
	elif offset.x > 0:
		offset.x -= 5
