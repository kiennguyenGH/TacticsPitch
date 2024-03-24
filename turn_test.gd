extends Node2D

signal turn_started(unit)

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
