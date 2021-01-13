extends Area2D

var bullet_scene := preload("res://Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed: int = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_viewport().size * Vector2(0.5,0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction_vector := Vector2(0,0)


	# todo pytagortas
	if Input.is_action_pressed("ui_left"):
		direction_vector.x = -1
	elif Input.is_action_pressed("ui_right"):
		direction_vector.x = 1
	if Input.is_action_pressed("ui_up"):
		direction_vector.y = -1
	elif Input.is_action_pressed("ui_down"):
		direction_vector.y = 1

	var velocity = direction_vector.normalized() * speed
	position += velocity * delta

	print("left: " + str(Input.is_action_pressed("ui_left")) + " ,"
	+ "right: " + str(Input.is_action_pressed("ui_right")) + " ,"
	+ "up: " + str(Input.is_action_pressed("ui_up")) + " ,"
	+ "down: " + str(Input.is_action_pressed("ui_down")))

	if Input.is_action_pressed("shoot"):
		print('hoi')
		# for gun in firing_positions.get_children():
		var bullet := bullet_scene.instance()
		bullet.global_position = global_position
		get_tree().current_scene.add_child(bullet)

	# if Input.is_action_pressed("move_left"):
	# 	direction_vector.x = -1
	# elif Input.is_action_pressed("move_right"):
	# 	direction_vector.x = 1
	# if Input.is_action_pressed("move_up"):
	# 	direction_vector.y = -1
	# elif Input.is_action_pressed("move_down"):
	# 	direction_vector.y = 1

	# velocity = direction_vector.normalized() * speed
	#
