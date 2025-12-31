
extends Node

export (PackedScene) var coin_scene
var max_coins = 10
var coins_spawned = 0

func _ready():
	Spawn_coins()

func _on_Coin_Picked():
	print("Picked")
	coins_spawned -= 1
	if coins_spawned <= 0:
		coins_spawned = 0
		Spawn_coins()

func Spawn_coin(x, y):
	var coin = coin_scene.instance()
	coin.position.x = x
	coin.position.y = y
	add_child(coin)
	coins_spawned += 1
	coin.connect("picked", self, "_on_Coin_Picked")

func Spawn_coins():
	for i in range(max_coins - coins_spawned):
		Spawn_coin(rand_range(0, 800), rand_range(0, 600))
