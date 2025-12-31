extends KinematicBody2D

export var speed = 600 # How fast the player will move (pixels/sec).
var screen_size
export (int) var gravity = 1400
export (int) var run_speed = 500
export (int) var jump_speed = -800






var player_death = false
var label: Label




var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('jump')

	if jump and is_on_floor() and !jumping:
		jumping = true
	
		velocity.y = jump_speed
		
	elif jumping and is_on_floor():
		jumping = false
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2(0, -1))





# Declare member variables here. Examples:
# var a = 2

func _ready():
	screen_size = get_viewport_rect().size

# var b = "text"
func _process(delta):
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x = 1
	if Input.is_action_pressed("move_left"):
		velocity.x = -1
	if jumping == true:
		$AnimatedSprite.animation = "jump"
		$AnimatedSprite.play()
		$AnimatedSprite.flip_v = velocity.y > 0
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.play()


	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)

# Called when the node enters the scene tree for the first time.
	if velocity.x == 0 and velocity.y == 0 and jumping == false:
		$AnimatedSprite.animation = "Idle"
		$AnimatedSprite.play()


	if velocity.x != 0 and jumping == false:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite.flip_h = velocity.x < 0
	
func _on_character_death():
	#get_tree().reload_current_scene()
	_ready()
	#get_tree().change_scene("res://scenes/level2.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




   


func _on_Enemy2_body_entered(body):
	if body.get_name() == "Player":
		player_death = true
		if player_death == true:
			if label == null:
				label = Label.new()
				label.text = "DEAD, DEAD, DEAD"
				add_child(label)
				label.rect_min_size = Vector2(0, 50)
				label.rect_position = Vector2(-25, -100)
	# Make the Label visible
			label.visible = true
			yield(get_tree().create_timer(.1), "timeout")
			pause_for_seconds(2)
			label.visible = false
			_on_character_death()

func _on_Enemy3_body_entered(body):
	if body.get_name() == "Player":
		player_death = true
		if player_death == true:
			if label == null:
				label = Label.new()
				label.text = "DEAD, DEAD, DEAD"
				add_child(label)
				label.rect_min_size = Vector2(0, 50)
				label.rect_position = Vector2(-25, -100)
	# Make the Label visible
			label.visible = true
			yield(get_tree().create_timer(.1), "timeout")
			pause_for_seconds(2)
			label.visible = false
			_on_character_death()

func pause_for_seconds(seconds):
	var milliseconds = seconds * 1000
	OS.delay_msec(milliseconds)

	# Code after the pause
	print("Resuming after", seconds, "seconds")


func _on_Enemy4_body_entered(body):
	if body.get_name() == "Player":
		player_death = true
		if player_death == true:
			if label == null:
				label = Label.new()
				label.text = "DEAD, DEAD, DEAD"
				add_child(label)
				label.rect_min_size = Vector2(0, 50)
				label.rect_position = Vector2(-25, -100)
	# Make the Label visible
			label.visible = true
			yield(get_tree().create_timer(.1), "timeout")
			pause_for_seconds(2)
			label.visible = false
			_on_character_death()




