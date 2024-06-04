extends Node

var volume = -80
var effects = -80

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MaineMenu.volume_db = volume
	$BricklayerMusic.volume_db = volume
	$ButtonSound.volume_db = effects
	$BrickPlacing.volume_db = effects
	$ConcretePlacing.volume_db = effects
	$WalkFloor.volume_db = effects
	$WalkGrass.volume_db = effects
	$FillMixerConcrete.volume_db = effects
	$FillMixerWater.volume_db = effects
	$FillMixerSand.volume_db = effects
	$WedgePlacing.volume_db = effects
	$Collect.volume_db = effects
	$MixerSound.volume_db = effects
	$SawSound.volume_db = effects
	

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

func _play_bricklayer():
	$BricklayerMusic.play()
func _stop_bricklayer():
	$BricklayerMusic.stop()
func _pause_bricklayer():
	$BricklayerMusic.stream_paused = true
func _continue_bricklayer():
	$BricklayerMusic.stream_paused = false






func _play_button():
	$ButtonSound.play()

func _play_brick_placing():
	$BrickPlacing.play()

func _play_concrete_placing():
	$ConcretePlacing.play()

func _play_walk_floor():
	$WalkFloor.play()

func _check_walk_floor():
	$WalkFloor.playing


func _stop_walk_floor():
	$WalkFloor.stop()

func _play_walk_grass():
	$WalkGrass.play()

func _check_walk_grass():
	$WalkGrass.playing

func _stop_walk_grass():
	$WalkGrass.stop()

func _play_fill_mixer_concrete():
	$FillMixerConcrete.play()

func _play_fill_mixer_water():
	$FillMixerWater.play()

func _play_fill_mixer_sand():
	$FillMixerSand.play()

func _play_wedge():
	$WedgePlacing.play()

func _play_mixer():
	$MixerSound.play()

func _play_saw():
	$SawSound.play()

func _play_string():
	$WedgeString.play()




