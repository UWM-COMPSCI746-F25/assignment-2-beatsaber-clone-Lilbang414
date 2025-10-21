extends Node3D

@export var blue_cube: PackedScene
@export var red_cube: PackedScene
var scaleDebug = Vector3(0.5, 0.5, 0.5)

func _ready() -> void:
	if blue_cube and red_cube:
		start_auto_spawn()

func start_auto_spawn():
	_spawn_with_random_delay()

func _spawn_with_random_delay():
	spawn_random_cube()
	var random_delay = randf_range(0.5, 2.0)
	await get_tree().create_timer(random_delay).timeout
	_spawn_with_random_delay()

func spawn_random_cube():
	var cube_scene = blue_cube if randf() > 0.5 else red_cube
	print("spawning cube")
	
	var cube = cube_scene.instantiate()
	if not cube:
		return
	
	get_tree().current_scene.add_child(cube)
	
	var mesh_instance = cube.find_child("MeshInstance3D")
	if mesh_instance:
		mesh_instance.scale = scaleDebug

	var forward = global_transform.basis.z.normalized()
	var right = global_transform.basis.x.normalized()
	
	var spawn_pos = global_transform.origin + forward * 10.0
	
	if cube_scene == blue_cube:
		print("blue")
		spawn_pos -= right * randf_range(.2, .8)
	else:
		print("red")
		spawn_pos += right * randf_range(.2, .8)
	
	spawn_pos.y += randf_range(.3, .8)
	
	cube.global_position = spawn_pos
