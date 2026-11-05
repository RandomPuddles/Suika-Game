extends Node2D
var fruitArray: Array[PackedScene] = [
	preload("res://Scenes/Apple.tscn"),
	preload("res://Scenes/Banana.tscn")
]

@onready var timer: Timer = $Timer # used for fruit cooldown

# Fruits that exist
var fruits = ["banana", "apple"]
var curFruit: RigidBody2D
var spawnedFruits = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curFruit = nextFruit() # Fruit object
	curFruit.freeze = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("drop_fruit") and timer.is_stopped():
		timer.start()
		fruitDrop()
	curFruit.global_position = Vector2(get_global_mouse_position().x, 50) # Held fruit follows mouse

# Randomly chooses held fruit
func nextFruit() -> RigidBody2D:
	var fruitScene = fruitArray.pick_random() # Random fruit selection
	var fruitInstance = fruitScene.instantiate()
	add_child(fruitInstance)
	fruitInstance.collision_layer = 0 # Disable collision for held fruit
	fruitInstance.collision_mask = 0
	return fruitInstance

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
	
	# Shows if any fruits are outside of the container
	for fruit in spawnedFruits:
		if fruit.position.x > 1000 or fruit.position.x < -1000 or fruit.position.y > 1000 or fruit.position.y < -1000:
			print(fruit.position)
