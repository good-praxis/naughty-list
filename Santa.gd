extends Area2D

var standard_sprite_size
var sprite_offset_direction

func _ready():
	# Connecting here to prevent debug errors in the editor
	$Sprite.connect("frame_changed", self, "_on_Sprite_frame_changed")
	standard_sprite_size = $Sprite.frames.get_frame('idle', 1).get_size()
	
	# This means it'll push up and right when the sprite is growing
	sprite_offset_direction = Vector2(1, -1)
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Sprite_frame_changed():
	var current_loop = $Sprite.animation
	var current_index = $Sprite.frame
	var current_sprite_size = $Sprite.frames.get_frame(current_loop, current_index).get_size()
	
	$Sprite.offset = (current_sprite_size - standard_sprite_size) * sprite_offset_direction
	print($Sprite.offset)
