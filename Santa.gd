extends Area2D

var standard_sprite_size
var sprite_offset_direction
var walking = false
var prev_anim

func _ready():
	# Connecting here to prevent debug errors in the editor
	$Sprite.connect("frame_changed", self, "_on_Sprite_frame_changed")
	standard_sprite_size = $Sprite.frames.get_frame('idle', 0).get_size()
	
	# This means it'll push up and right when the sprite is growing
	sprite_offset_direction = Vector2(1, -1)
	

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		$Sprite.flip_h = false
		
	
	if Input.is_action_just_pressed("ui_left"):
		$Sprite.flip_h = true
	pass


func _on_Sprite_frame_changed():
	switch_sprite_offset($Sprite.animation)
	
	
func switch_sprite_offset(anim):
	match anim:
		"idle":
			sprite_idle_offset(anim)
		"walk":
			sprite_walk_offset(anim)
		_:
			pass

func sprite_idle_offset(idle):
	match [$Sprite.frame, $Sprite.flip_h]:
		[3, false], [4, false]:
			$Sprite.offset = Vector2(0, 1)
		[4, true]:
			$Sprite.offset = Vector2(-1, 1)
		[3, true]:
			$Sprite.offset = Vector2(-1, 1)
		[_, false]:
			$Sprite.offset = Vector2(0, 0)
		[_, true]:
			$Sprite.offset = Vector2(-1, 0)
	

func sprite_walk_offset(walk):
	match $Sprite.frame:
		0, 2, 4, 6:
			$Sprite.offset = Vector2(0, -1)
		1, 5:
			$Sprite.offset = Vector2(0, -2)
		_:
			$Sprite.offset = Vector2(0, 0)


	
func store():
	pass

	

