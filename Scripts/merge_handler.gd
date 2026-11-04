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
	var nextFruit = fruit1.fruitLevel + 1
	
	if nextFruit > fruits.size() - 1:
		
	
	fruit1.queue_free()
	fruit2.queue_free()
