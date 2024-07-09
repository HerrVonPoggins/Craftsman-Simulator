extends Node3D


var roof_step = 0
var played = false
var played2 = false
var played3 = false
var played4 = false
var played5 = false
var played6 = false
var played7 = false
var played8 = false
var played9 = false
var played10 = false
var played11 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if roof_step == 1 and played == false:
		played = true
		$HauptbinderStatic.visible = true
		$RoofAnimations.play("hauptbinder_down")
		$Metallbinder/RootNode/Metallbinder_001.visible = true
		$Metallbinder/RootNode/Metallbinder_002.visible = true
		$Metallbinder/RootNode/Metallbinder_003.visible = true
		$Metallbinder/RootNode/Metallbinder_004.visible = true
		$Metallbinder/RootNode/Metallbinder_005.visible = true
		$Metallbinder/RootNode/Metallbinder_006.visible = true
		$Metallbinder/RootNode/Metallbinder_007.visible = true
		$Metallbinder/RootNode/Metallbinder_008.visible = true
		$Metallbinder/RootNode/Metallbinder_024.visible = true
		$Metallbinder/RootNode/Metallbinder_025.visible = true
		$Metallbinder/RootNode/Metallbinder_026.visible = true
		$Metallbinder/RootNode/Metallbinder_027.visible = true
		$Metallbinder/RootNode/Metallbinder_028.visible = true
		$Metallbinder/RootNode/Metallbinder_029.visible = true
		$Metallbinder/RootNode/Metallbinder_030.visible = true

	if roof_step == 2 and played2 == false:
		played2 = true
		$EckenbinderStatic.visible = true
		$RoofAnimations.play("eckbinder_down")
		await $RoofAnimations.animation_finished
		roof_step = 3

	if roof_step == 3 and played3 == false:
		played3 = true
		$"SchrägLinksStatic".visible = true
		$RoofAnimations.play("schräg_links_down")
		await $RoofAnimations.animation_finished
		$Metallbinder/RootNode/Metallbinder_033.visible = true
		$Metallbinder/RootNode/Metallbinder_034.visible = true
		$Metallbinder/RootNode/Metallbinder_035.visible = true
		$Metallbinder/RootNode/Metallbinder_036.visible = true
		$Metallbinder/RootNode/Metallbinder_037.visible = true
		$Metallbinder/RootNode/Metallbinder_038.visible = true
		$Metallbinder/RootNode/Metallbinder_039.visible = true
		$Metallbinder/RootNode/Metallbinder_040.visible = true
		$Metallbinder/RootNode/Metallbinder_041.visible = true
		$Metallbinder/RootNode/Metallbinder_042.visible = true
		$Metallbinder/RootNode/Metallbinder_043.visible = true

	if roof_step == 4 and played4 == false:
		played4 = true
		$"SchrägRechtsStatic".visible = true
		$RoofAnimations.play("schräg_rechts_down")
		await $RoofAnimations.animation_finished
		$Metallbinder/RootNode/Metallbinder_011.visible = true
		$Metallbinder/RootNode/Metallbinder_012.visible = true
		$Metallbinder/RootNode/Metallbinder_013.visible = true
		$Metallbinder/RootNode/Metallbinder_014.visible = true
		$Metallbinder/RootNode/Metallbinder_015.visible = true
		$Metallbinder/RootNode/Metallbinder_016.visible = true
		$Metallbinder/RootNode/Metallbinder_017.visible = true
		$Metallbinder/RootNode/Metallbinder_018.visible = true
		$Metallbinder/RootNode/Metallbinder_019.visible = true
		$Metallbinder/RootNode/Metallbinder_020.visible = true
		$Metallbinder/RootNode/Metallbinder_021.visible = true

	if roof_step == 5 and played5 == false:
		played5 = true
		$WalmbinderStatic.visible = true
		$RoofAnimations.play("walmbinder_down")
		await $RoofAnimations.animation_finished
		$Metallbinder/RootNode/Metallbinder_009.visible = true
		$Metallbinder/RootNode/Metallbinder_010.visible = true
		$Metallbinder/RootNode/Metallbinder.visible = true
		$Metallbinder/RootNode/Metallbinder_031.visible = true
		$Metallbinder/RootNode/Metallbinder_032.visible = true
		$Metallbinder/RootNode/Metallbinder_022.visible = true
		$Metallbinder/RootNode/Metallbinder_023.visible = true
	
	if roof_step == 6 and played6 == false:
		played6 = true
		$DachplaneStatic.visible = true
		$RoofAnimations.play("dachplane_down")
		await $RoofAnimations.animation_finished
		
		$KonterlattungKanten.visible = true
		$RoofAnimations.play("konterlattung_katten_down")
		await $RoofAnimations.animation_finished
		
		$"KonterlattungStützen".visible = true
		$RoofAnimations.play("konterlattung_stützen_down")
		await $RoofAnimations.animation_finished
		
		$"VertikaleStützen".visible = true
		$RoofAnimations.play("vertikale_stützen_down")
		await $RoofAnimations.animation_finished
		
		$"HorizontalStützen".visible = true
		$RoofAnimations.play("horizontale_stützen_down")
		await $RoofAnimations.animation_finished
		
		$Dachziegel.visible = true
		$Dachziegel/AnimationPlayer.play("Scene")
		await $Dachziegel/AnimationPlayer.animation_finished
		
		DialogueManager.show_example_dialogue_balloon(load("res://dialoguefiles/zimmermann_step_3.dialogue"))
		
		
		
		
