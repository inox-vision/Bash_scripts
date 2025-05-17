#! /bin/bash

# This is a template for organising rendering in BLENDER.
# You can prepare DRAFT render settings template and FINAL settings
# template with Python scripts and change template for a scene 
# with one variable.

#RENDER_SETTINGS#

_DR="draft_render_settings"
_F="final_render_settings"

# DRAFT SETTINGS #
echo "import bpy

for scene in bpy.data.scenes:
    scene.cycles.use_adaptive_sampling = 1
    scene.cycles.adaptive_threshold = 0.02
    scene.cycles.samples = 50
    scene.cycles.use_denoising = 1
    scene.cycles.denoiser = 'OPENIMAGEDENOISE'
	# 'OPTIX' | 'OPENIMAGEDENOISE'
    scene.render.resolution_x = 1920	
    scene.render.resolution_y = 1080
    scene.render.resolution_percentage = 65" > $_DR

# FINAL SETTINGS #
echo "import bpy

for scene in bpy.data.scenes:
    scene.cycles.use_adaptive_sampling = 1
    scene.cycles.adaptive_threshold = 0.015
    scene.cycles.samples = 250
    scene.cycles.use_denoising = 1
    scene.cycles.denoiser = 'OPENIMAGEDENOISE'
	# 'OPTIX' | 'OPENIMAGEDENOISE'
    scene.render.resolution_x = 1920	
    scene.render.resolution_y = 1080
    scene.render.resolution_percentage = 100" > $_F


scene_1="path/to/file"

blender -b "$scene_1" 	-P $_DR		-S "Scene"		-s 0 -e 100		-a # actual scene length to set up for final rendering. Just a reminder. In case you rendered some smaller parts: 0 - 100

scene_2=""

blender -b "$scene_2" 	-P $_DR		-S "Scene"		-s 0 -e 100		-a # 0 - 100

scene_3=""

blender -b "$scene_3" 	-P $_DR		-S "Scene"		-s 0 -e 100		-a # 0 - 100

scene_4=""

blender -b "$scene_4" 	-P $_DR		-S "Scene"		-s 0 -e 100		-a # 0 - 100

scene_5=""

blender -b "$scene_5" 	-P $_DR		-S "Scene"		-s 0 -e 100		-a # 0 - 100

















rm $_DR
rm $_F




