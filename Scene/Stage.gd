extends Node2D


const NUMBER_OBJ = preload("res://Scene/Number.tscn")
var victory = false
var ordered = true


func _ready():
	var x = 44
	var y = 44
	for n in range(16):
		var number_obj = NUMBER_OBJ.instance()
		number_obj.name = "Number_" + String(n)
		number_obj.number = n + 1
		add_child(number_obj)
		number_obj.position = Vector2(x, y)
		x = x + 128
		if(x>535):
			x = 44
			y = y + 128

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isOrdered():
		print(isOrdered())
	if ordered:
		ordered = false
		for n in range(100):
			for p in range(get_child_count()):
				if get_child(p).is_class("Number"):
					if get_child(p).number == 16:
						randomize()
						get_child(p).moveToMix(randi()%4);
	
func isOrdered():
	for n in get_child_count()-1:
		if get_child(n).is_class("Number"):
			if(get_child(n).number > get_child(n+1).number):
				return false
	return true
