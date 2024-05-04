extends Node2D

signal turn_started(unit)
<<<<<<< Updated upstream

@onready var order = ["Field/unit_1","Field/unit_2","Field/unit_3"]
# Called when the node enters the scene tree for the first time.
func _ready():
	order = ["Field/unit_1","Field/unit_2","Field/unit_3"] # Change Based on Speed Order
	get_node(order[0]).reparent(get_node("Field/turn_order"))
	order[0] = order[0].insert(6,"turn_order/")
	turn_started.emit(get_node(order[0]))

func _on_move_pressed():
	get_node(order[0]).reparent(get_node("Field"))
	order[0] = "Field/"+order[0].substr(17)
	order.push_back(order[0])
	order.pop_front()
	get_node(order[0]).reparent(get_node("Field/turn_order"))
	order[0] = order[0].insert(6,"turn_order/")
	turn_started.emit(get_node(order[0]))

func _on_wait_pressed():
	get_node(order[0]).reparent(get_node("Field"))
	order[0] = "Field/"+order[0].substr(17)
	order.push_back(order[0])
	order.pop_front()
	get_node(order[0]).reparent(get_node("Field/turn_order"))
	order[0] = order[0].insert(6,"turn_order/")
	turn_started.emit(get_node(order[0]))
=======
signal changing_speed(stat)
signal requesting_speed()

# IM GOING TO KILL A MACHINE

var unit_data = preload("res://unit.tscn")
var health
var speed
var label

var order = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 3:
		new_unit()
		order.append(unit_i)
		unit_i.move_local_x(randi_range(0,100))
		unit_i.move_local_y(randi_range(0,100))
	turn_started.emit(order[0])

static func new_unit(name, speed = randi_range(1,10), health = 10):
	var new

func _on_move_pressed():
	order.push_back(order[0])
	order.pop_front()
	turn_started.emit(order[0])

func _on_wait_pressed():
	order.push_back(order[0])
	order.pop_front()
	turn_started.emit(order[0])
	print(order[0].name)

func on_unit_speed_set(speed):
	print(speed)
>>>>>>> Stashed changes
