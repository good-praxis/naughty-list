extends AnimatedSprite

var originalSize

func _ready():
	var start_frame = frames.get_frame("idle", 0)
	originalSize = start_frame.get_size()
	print(originalSize)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Sprites_frame_changed():
	print("log")
	pass # replace with function body
