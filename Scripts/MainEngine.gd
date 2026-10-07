extends Node2D
var apple_scene: PackedScene = preload("res://Scenes/Apple.tscn")

# Fruits that exist
var fruits = ["cherry", "apple"]
var curFruit: RigidBody2D
var fruitHeld = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curFruit = nextFruit() # Fruit object
	curFruit.freeze = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if fruitHeld == true:
		curFruit.global_position = Vector2(get_global_mouse_position().x, 50)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		fruitDrop()

func nextFruit() -> RigidBody2D:
	var fruit = fruits.pick_random() # Random fruit selection
	if fruit == "apple":
		var apple_instance = apple_scene.instantiate()
		add_child(apple_instance)
		var apple: RigidBody2D = apple_instance.get_node("RigidBody2D")
		return apple
	else:
		var apple_instance = apple_scene.instantiate()
		add_child(apple_instance)
		var apple: RigidBody2D = apple_instance.get_node("RigidBody2D")
		return apple

# Triggered upon left-click
func fruitDrop() -> void:
	curFruit.freeze = false
	curFruit.duplicate()
	curFruit = nextFruit()
