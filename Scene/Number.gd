extends KinematicBody2D

export(int) var number
var dragMouse = false
var velocity = Vector2()
var mousePosition = Vector2()
var numberIcon

func _ready():
	if number == 16:
		$Sprite.texture = null
	#else:
		#$Label.text = String(number)
		#$Sprite.texture = load("res://Assets/NumberIcon" + String(number) + ".png")
		#$Sprite.texture = load("res://Assets/NumberIcon1" + ".png")
func _physics_process(delta):
	#if dragMouse:
	#	set_position(get_viewport().get_mouse_position())
	#	velocity = move_and_slide(velocity)
	pass


func _on_Number_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		inputMove()

func inputMove():
	moveNumbers($Up)
	moveNumbers($Down)
	moveNumbers($Left)
	moveNumbers($Right)
		
func moveToMix(random):
	if random == 0:
		if($Up.is_colliding()):
			$Up.get_collider().inputMove()
	if random == 1:
		if($Down.is_colliding()):
			$Down.get_collider().inputMove()
	if random == 2:
		if($Left.is_colliding()):	
			$Left.get_collider().inputMove()
	if random == 3:
		if($Right.is_colliding()):
			$Right.get_collider().inputMove()
		
func moveNumbers(side):
	if side.get_collider() != null and side.get_collider().is_class(get_class()):
		if side.get_collider().number == 16:
			side.get_collider().setNumber(number)
			$Label.text = ""
			$Sprite.texture = null
			number = 16
			
func setNumber(newNumber):
	number = newNumber
	$Label.text = String(number)
	$Sprite.texture = load("res://Assets/NumberIcon" + String(number) + ".png")
	
func get_class():
	return "Number"
	
func is_class(type):
	return get_class() == type
