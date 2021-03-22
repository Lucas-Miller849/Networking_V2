extends Node


func _ready():
	pass

func instance_node(prefab:Object, parent:Object) -> Object:
	var instance = prefab.instance()
	parent.add_child(instance)
	return instance

func instance_node_at(prefab:Object, parent:Object, location:Vector3) -> Object:
	var instance = instance_node(prefab, parent)
	instance.translation = location
	return instance 
