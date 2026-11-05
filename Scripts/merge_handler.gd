extends Node2D

var fruits: Array[PackedScene] = [
	preload("res://Scenes/Apple.tscn"),
	preload("res://Scenes/Banana.tscn")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func mergeFruits(fruit1: Fruit, fruit2: Fruit) -> void:
	# Calculate resulting fruit
	var nextFruit = fruit1.fruitLevel + 1
	if nextFruit >= fruits.size():
		nextFruit = nextFruit - 1
	
	# Save fruits' positions
	var pos1 = fruit1.global_position
	var pos2 = fruit2.global_position
	
	# Average positions to get spawned-fruit's position
	var avgPos = (pos1 + pos2) / 2
	
	# Spawn new fruit and bring to position
	var newFruit: Fruit = fruits[nextFruit].instantiate()
	add_child(newFruit)
	newFruit.global_position = avgPos
	
	# Delete merged fruits
	fruit1.queue_free()
	fruit2.queue_free()
