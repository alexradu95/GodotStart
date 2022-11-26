tool
extends EditorScenePostImport

# We automatically create a collision mesh when we import the asset
func post_import(scene):
	scene = scene as Spatial
	var mesh = scene.get_child(0) as MeshInstance
	mesh.create_trimesh_collision()
	
	return scene
