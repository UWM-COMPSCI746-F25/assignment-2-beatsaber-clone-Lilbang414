extends Area3D

@onready var audio_player = $Saber_Right/AudioStreamPlayer3D

func _ready():
	print("=== SABER COLLISION DEBUG ===")
	print("Saber name: ", name)
	var collision_shape = $CollisionShape3D
	if not area_entered.is_connected(_on_area_entered):
		area_entered.connect(_on_area_entered)
	if collision_shape:
		print("✓ Saber CollisionShape3D found")
		var shape = collision_shape.shape
		if shape:
			print("✓ Saber shape: ", shape.get_class())
			if shape is BoxShape3D:
				shape.size = Vector3(2.0, 2.0, 2.0)
				print("✓ Saber collision size: ", shape.size)
	else:
		print("✗ No CollisionShape3D on saber!")
	
	collision_layer = 4
	collision_mask = 3 
	print("Saber collision layer: ", collision_layer)
	print("Saber collision mask: ", collision_mask)
	print("Saber global position: ", global_position)
	print("=== SABER DEBUG COMPLETE ===")
	
func _on_area_entered(area: Area3D):
		print("Saber hit cube!")
		play_hit_sound()
	
	
	
func play_hit_sound():
	if audio_player:
		audio_player.play()

func _process(delta):
	pass
