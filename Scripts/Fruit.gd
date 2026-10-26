class_name Fruit
extends RigidBody2D

signal merge_requested(fruit1: Fruit, fruit2: Fruit)

@export var fruitLevel = 0
var merging = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(fruitTouchCheck)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func fruitTouchCheck(body: Node):
	if merging == false and body is Fruit:
		if body.fruitLevel == fruitLevel: # Only merge same-type fruits
			merging = true
			if get_instance_id() < body.get_instance_id(): # Only one fruit sends a merge request
				merge_requested.emit(self, body)
	pass
