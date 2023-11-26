extends Area2D

var player_in_area = false

func _ready():
	body_entered.connect(self._on_body_entered)
	body_exited.connect(self._on_body_exited)
	

func _physics_process(delta):
	if player_in_area and Input.is_action_just_pressed("ui_accept"):
		# Logic to change level or open the door
		var result = get_tree().change_scene_to_file("res://Level2.tscn")
		if result != OK:
			print("Failed to change scene. Error code: ", result)
		else:
			print("Door interaction triggered")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_in_area = true
	else:
		print("something else is in the door")
		player_in_area = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_in_area = false
