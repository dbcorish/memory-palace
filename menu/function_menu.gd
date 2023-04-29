extends Spatial

export (XRTools.Buttons) var menu_button : int = XRTools.Buttons.VR_BUTTON_BY

onready var _controller := ARVRHelpers.get_arvr_controller(self)
onready var menu = get_tree().get_root().get_node("Main").get_node("Menu")
onready var menuLocation = get_tree().get_root().get_node("Main").get_node("FPController").get_node("ARVRCamera").get_node("MenuLocation") # In front of camera at all times

func _ready():
	# Monitor Y Button
	_controller.connect("button_pressed", self, "_on_button_pressed")

func _on_button_pressed(p_button) -> void: # When Y button is pressed
	if (p_button == menu_button and !_controller.is_button_pressed(XRTools.Buttons.VR_GRIP)): # If we're not holding an item...
		menu.global_transform = menuLocation.global_transform # Re-position the menu
		menu.rotation *= Vector3(1,1,0) # Ensure menu is horizontal
