extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _play_collect():
	$Collect.play()

func _play_main_menu():
	$MaineMenu.play()
func _stop_main_menu():
	$MaineMenu.stop()
func _pause_main_menu():
	$MaineMenu.stream_paused = true
func _continue_main_menu():
	$MaineMenu.stream_paused = false

func _play_button():
	$ButtonSound.play()

func _play_brick_placing():
	$BrickPlacing.play()

func _play_Concrete_Placing():
	$ConcretePlacing.play()

func _play_walk_floor():
	$WalkFloor.play()

func _play_walk_grass():
	$WalkGrass.play()

func _play_fill_mixer_concrete():
	$FillMixerConcrete.play()

func _play_fill_mixer_water():
	$FillMixerWater.play()

func _play_fill_mixer_sand():
	$FillMixerSand.play()

func _play_Wedge():
	$WedgePlacing.play()

func _play_mixer():
	$MixerSound.play()

func _play_saw():
	$SawSound.play()





