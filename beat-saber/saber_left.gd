extends Area3D

@onready var saber_on = true
@onready var left_controller = $"../.."
var can_press_button = true
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
	if left_controller and left_controller.is_button_pressed("ax_button") and can_press_button:
		print("x button pressed!")
		handle_a_button()
		can_press_button = false
		await get_tree().create_timer(0.5).timeout
		can_press_button = true

func handle_a_button():
		if saber_on:
			saber_on = false
		else:
			saber_on = true
		saber_switch()
	
func saber_switch():
	if saber_on:
		visible = true
		$CollisionShapeLeft.disabled = false
	else:
		visible = false
		$CollisionShapeLeft.disabled = true
		
		
