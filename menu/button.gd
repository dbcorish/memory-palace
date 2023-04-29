extends Button

export(PackedScene) var object
export(Texture) var image
onready var menu = get_tree().get_root().get_node("Main").get_node("Menu")

# Called when the node enters the scene tree for the first time.
func _ready():
	icon = image # Set button icon

func _pressed():
	var spawnedObject = object.instance() # Create instance of object
	spawnedObject.global_transform = menu.global_transform # Place at menu
	add_child(spawnedObject)
