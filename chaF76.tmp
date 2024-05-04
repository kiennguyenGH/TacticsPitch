# character_stats.gd
# This script defines a character for a turn-based tile RPG game.
# It includes properties such as HP (health points), Attack, Speed, and Movement Range.
# The character can take damage, attack other characters, and its movement potential is defined by its range.
# Attach this script to any node that represents a character in the game (e.g., KinematicBody2D, Sprite).

extends Node

# Character stats (these are the defaults and can be modified as desired, either here or in the inspector)
class_name Character
var character_name  = "Unnamed" # Name of the character
var max_hp = 100 # Maximum health points
var current_hp = max_hp # Current health points
var attack = 10 # Attack power
var speed = 5 # Determines turn order
var movement_range = 3 # How many tiles the character can move in one turn
@onready var _focus = $Focus

# Constructor to initialize a character with custom stats
func _init(_character_name , _max_hp, _attack, _speed, _movement_range):
	character_name  = _character_name 
	max_hp = _max_hp
	current_hp = max_hp
	attack = _attack
	speed = _speed
	movement_range = _movement_range

# Method for taking damage, reducing HP and checking for defeat
func take_damage(amount):
	var damage = amount
	current_hp -= damage
	current_hp = max(current_hp, 0) # Prevent HP from going below 0
	if current_hp == 0:
		print(character_name  + " has been defeated!") 
		#different method can be implmented here based on how we want to handle defeat

# Method for attacking another character, triggering their take_damage method
func attack_target(target : Character):
	target.take_damage(attack)

# Method to check if the character is alive (HP > 0)
func is_alive():
	return current_hp > 0
	
func focus():
	_focus.show()
	
func unfocus():
	_focus.hide()

# vvvvvvvvvvvv Information on how to utilize this script with mutiple characters: vvvvvvvvvvv
# --------------------------------------------------------------------------------------------
# Customize Characters: To create characters with different stats, you can either 
# Set the properties directly in the editor (if exposed) or instantiate them in another script. 
# For example, in a game manager or a scene setup script, you might do something like:

# var hero = character_stats.new("Hero", 150, 20, 7, 4)
# add_child(hero)
# hero.position = Vector2(100, 100) # Position the character on the scene
