extends KinematicBody

export var speed:float = 300
export var rot_speed:float = 1

var velocity = Vector3() 
var rot:float

func _ready():
	pass
	

func _process(delta):
	get_input()

func _physics_process(delta):
	rotate_y(rad2deg(rot) * rot_speed * delta)
	
	var look_direction = velocity.rotated(Vector3.UP,rotation.y)
	move_and_slide(look_direction.normalized() * speed * delta)

func get_input():
	velocity.x = Input.get_action_strength("strafe_right") - Input.get_action_strength("strafe_left")
	velocity.z = Input.get_action_strength("back") - Input.get_action_strength("forward")
	
	rot = Input.get_action_strength("turn_right") - Input.get_action_strength("turn_left")
	
