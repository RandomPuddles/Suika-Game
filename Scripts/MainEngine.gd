extends Node2D
var apple_scene: PackedScene = preload("res://Scenes/Apple.tscn")

# Fruits that exist
var fruits = ["cherry", "apple"]
var curFruit: RigidBody2D
var spawnedFruits = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curFruit = nextFruit() # Fruit object
	curFruit.freeze = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("drop_fruit"):
		fruitDrop()
	curFruit.global_position = Vector2(get_global_mouse_position().x, 50) # Held fruit follows mouse

func nextFruit() -> RigidBody2D:
	var fruit = fruits.pick_random() # Random fruit selection
	if fruit == "apple":
		var apple_instance = apple_scene.instantiate()
		add_child(apple_instance)
		apple_instance.collision_layer = 0 # Disable collision for held fruit
		apple_instance.collision_mask = 0
		return apple_instance
	else:
		var apple_instance = apple_scene.instantiate()
		add_child(apple_instance)
		apple_instance.collision_layer = 0
		apple_instance.collision_mask = 0
		return apple_instance

# Triggered upon left-click
func fruitDrop() -> void:
	curFruit.freeze = false
	curFruit.sleeping = false
	curFruit.collision_layer = 1 # Enable collision for dropped fruit
	curFruit.collision_mask = 1
	
	spawnedFruits.append(curFruit)

	curFruit = nextFruit()
	curFruit.collision_layer = 0 # Disable collision for held fruit
	curFruit.collision_mask = 0
	curFruit.freeze = true
	
	for fruit in spawnedFruits:
		print(fruit.position)
