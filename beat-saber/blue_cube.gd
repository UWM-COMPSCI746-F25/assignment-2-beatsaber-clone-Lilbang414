extends Area3D

var speed = 5
var lifetime = 10
func _ready():
	collision_mask = 4
	if not area_entered.is_connected(_on_area_entered):
		area_entered.connect(_on_area_entered)
	
	var collision_shape = $CollisionShape3D
	if collision_shape:
		var shape = collision_shape.shape
		if shape is BoxShape3D:
			shape.size = Vector3(1.0, 1.0, 1.0)
	start_lifetime_timer()

func _process(delta: float) -> void:
	global_position.z -= speed * delta
	
func start_lifetime_timer():
	await get_tree().create_timer(lifetime).timeout
	if is_instance_valid(self):
		print("Cube auto-destroyed after 10 seconds")
		queue_free()
		
func _on_area_entered(_area: Area3D):
	print("Cube hit by saber!")
	
	$CollisionShape3D.disabled = true
	$MeshInstance3D.visible = false
	
	var audio_player = $AudioStreamPlayer3D
	if audio_player:
		print("playing audio")
		audio_player.play()
		audio_player.finished.connect(queue_free)
	else:
		await get_tree().create_timer(0.1).timeout
		queue_free()
