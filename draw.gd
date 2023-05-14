class_name DebugDraw

static func draw_box(aabb: AABB) -> MeshInstance3D:

	var box := ImmediateMesh.new()
	var material : StandardMaterial3D = set_material()

	var vertices = set_vertices(aabb)
	var edges = set_edges()

	box.clear_surfaces()
	box.surface_begin(Mesh.PRIMITIVE_LINES, material)

	for edge in edges:
		box.surface_add_vertex(vertices[edge[0]])
		box.surface_add_vertex(vertices[edge[1]])

	box.surface_end()

	var debug_instance := MeshInstance3D.new()
	debug_instance.mesh = box

	return debug_instance

static func set_material() -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = Color.RED
	return material

static func set_vertices(aabb: AABB) -> Array:
	var vertices : Array = []
	for i in range(8):
		vertices.append(aabb.get_endpoint(i))
	print("vertices: ", vertices)
	return vertices

static func set_edges() -> Array:
	return [

		[0, 2], [2, 6], [6, 4], [4, 0],  # FACE A
		[1, 3], [3, 7], [7, 5], [5, 1],  # FACE B
		[0, 1], [2, 3], [4, 5], [6, 7]   # ROWS
	]
	
	
