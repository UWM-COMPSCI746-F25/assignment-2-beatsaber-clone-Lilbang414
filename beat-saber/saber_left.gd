extends Area3D

func _ready():
	print("=== SABER COLLISION DEBUG ===")
	print("Saber name: ", name)
	
	var collision_shape = $CollisionShapeLeft
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
	
	collision_layer = 8
	print("Saber collision layer: ", collision_layer)
	print("Saber collision mask: ", collision_mask)
	print("Saber global position: ", global_position)
	print("=== SABER DEBUG COMPLETE ===")

func _process(delta):
	pass
