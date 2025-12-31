extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
export var speed = 600 # How fast the player will move (pixels/sec).
var screen_size 
var fallSpeed = 500
var starting_position
export (int) var run_speed = 500
export (int) var jump_speed = -800
var rand = randi()% 200 + 100

func _ready():
	starting_position = position
	gravity = 1400
	speed = rand
	screen_size = get_viewport_rect().size
	if position.x < screen_size.x / 2:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play()

	if position.x > screen_size.x / 2:
		speed *= -1
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.play()
		

func _on_VisibilityNotifier2D_screen_exited():
	position = starting_position
	
	
	rand = randi()% 200 + 100
	if position.x > screen_size.x /2:
		rand *= -1
		
	speed = rand
		
		# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):

	position.x += speed * delta
	position.y += fallSpeed * delta



func _on_Enemy_body_exited(body):
	if body.get_class() == "TileMap":
		fallSpeed = 500 # Replace with function body.


func _on_Enemy_body_entered(body):
	 # Replace with function body.
	if body.get_class() == "TileMap": 
		fallSpeed = 0 # Replace with function body.
