	object_const_def
	const VALENCIA_ISLAND_YOUNGSTER
	const VALENCIA_ISLAND_TECHNOLOGY_GUY
	const VALENCIA_ISLAND_LASS
	const VALENCIA_ISLAND_IVY
	const VALENCIA_ISLAND_DRATINI
	const VALENCIA_ISLAND_CROSS

ValenciaIsland_MapScripts:
	def_scene_scripts
	scene_script .ValenciaIslandNoOp, SCENE_VALENCIA_ISLAND_NOOP
	scene_script .AltStarterScript, SCENE_VALENCIA_ISLAND_ALT_STARTER

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ValenciaIslandFlypointCallback
	callback MAPCALLBACK_TILES, ValenciaIslandAltStarterEventCutTreeCallback

.ValenciaIslandNoOp:
	end

.AltStarterScript:
	priorityjump .AltStarterCutscene
	end
	
.AltStarterCutscene:
	applymovement PLAYER, ASPlayerMovement1
	turnobject VALENCIA_ISLAND_IVY, UP
	opentext
	writetext ASIvyScriptText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VALENCIA_ISLAND_IVY, PLAYER
	applymovement VALENCIA_ISLAND_IVY, ASIvyMovement1
	turnobject PLAYER, LEFT
	turnobject VALENCIA_ISLAND_IVY, RIGHT
	opentext
	writetext ASIvyScriptText2
	waitbutton
	closetext
	applymovement VALENCIA_ISLAND_IVY, ASIvyMovement2
	turnobject PLAYER, DOWN
	turnobject VALENCIA_ISLAND_IVY, UP
	opentext
	writetext ASIvyScriptText3
	waitbutton
	closetext
	checkevent EVENT_MEET_SECRET_STARTER_REQS
	iftrue .DratiniScript
	applymovement VALENCIA_ISLAND_IVY, ASIvyMovement3
	stopfollow
	turnobject VALENCIA_ISLAND_IVY, LEFT
	showemote EMOTE_SHOCK, VALENCIA_ISLAND_IVY, 15
	turnobject VALENCIA_ISLAND_IVY, UP
	opentext
	writetext ASIvyScriptText4
	waitbutton
	closetext
	applymovement VALENCIA_ISLAND_IVY, ASIvyMovement4
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, VALENCIA_ISLAND_IVY, 15
	opentext
	writetext ASIvyScriptText5
	checkevent EVENT_GOT_PIKACHU_FROM_IVY
	iftrue .ASPikachuScript
	setevent EVENT_GOT_EEVEE_FROM_IVY
	givepoke EEVEE, 5
	cry EEVEE
	loadwildmon EEVEE, 5
.ContinueASPikaOrEevee
	catchtutorial BATTLETYPE_TUTORIAL
	applymovement VALENCIA_ISLAND_IVY, ASIvyMovement5
	turnobject PLAYER, DOWN
	turnobject VALENCIA_ISLAND_IVY, UP
	opentext
	checkevent EVENT_GOT_PIKACHU_FROM_IVY
	iftrue .ASPikachuScript2
	getmonname STRING_BUFFER_3, EEVEE
	writetext ASIvyScriptText6
	waitbutton
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
.ContinueASPikaOrEevee2
	;do you want to give it a nickname
	writetext ASIvyScriptText7
	waitbutton
	closetext
	setscene SCENE_VALENCIA_ISLAND_NOOP
	setmapscene IVYS_LAB, SCENE_IVYSLAB_ALT_STARTER
	setevent EVENT_ALT_STARTER_VALENCIA_IVY
	special FadeOutPalettes
	waitsfx
	warp IVYS_LAB, 2, 5
	end
	
.ASPikachuScript
	setevent EVENT_GOT_PIKACHU_FROM_IVY
	givepoke PIKACHU, 5
	cry PIKACHU
	loadwildmon PIKACHU, 5
	sjump .ContinueASPikaOrEevee
	
.ASPikachuScript2
	getmonname STRING_BUFFER_3, PIKACHU
	writetext ASIvyScriptText8
	waitbutton
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	sjump .ContinueASPikaOrEevee2

.DratiniScript:
	applymovement VALENCIA_ISLAND_IVY, ASIvyMovement6
	stopfollow
	special RestartMapMusic
	turnobject VALENCIA_ISLAND_IVY, DOWN
	turnobject PLAYER, DOWN
	opentext
	writetext ASIvyScriptText9
	waitbutton
	closetext
	cry DRATINI
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	showemote EMOTE_SHOCK, VALENCIA_ISLAND_IVY, 15
	opentext
	writetext ASIvyScriptText10
	waitbutton
	closetext
	clearevent EVENT_DRATINI_VALENCIA_APPEAR
	appear VALENCIA_ISLAND_DRATINI
	applymovement VALENCIA_ISLAND_IVY, ASIvyMovement7
	follow VALENCIA_ISLAND_IVY, PLAYER
	applymovement VALENCIA_ISLAND_IVY, ASIvyMovement8
	stopfollow
	showemote EMOTE_SHOCK, VALENCIA_ISLAND_IVY, 15
	opentext
	writetext ASIvyScriptText11
	waitbutton
	closetext
	turnobject VALENCIA_ISLAND_IVY, RIGHT
	opentext
	writetext ASIvyScriptText12
	waitbutton
	turnobject VALENCIA_ISLAND_IVY, LEFT
	givepoke DRATINI, 5
	cry DRATINI
	loadwildmon DRATINI, 5
	catchtutorial BATTLETYPE_TUTORIAL
	setevent EVENT_DRATINI_VALENCIA_APPEAR
	disappear VALENCIA_ISLAND_DRATINI
	turnobject VALENCIA_ISLAND_IVY, RIGHT
	opentext
	getmonname STRING_BUFFER_3, DRATINI
	writetext ASIvyScriptText13
	waitbutton
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	;do you want to give it a nickname
	writetext ASIvyScriptText7
	waitbutton
	closetext
	setscene SCENE_VALENCIA_ISLAND_NOOP
	setmapscene IVYS_LAB, SCENE_IVYSLAB_ALT_STARTER
	setevent EVENT_ALT_STARTER_VALENCIA_IVY
	setevent EVENT_GOT_DRATINI_FROM_IVY
	special FadeOutPalettes
	waitsfx
	warp IVYS_LAB, 2, 5
	end
	
ValenciaIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	endcallback
	
ValenciaIslandAltStarterEventCutTreeCallback:
	checkevent EVENT_ALT_STARTER_VALENCIA_IVY
	iftrue .DoNothingToTheTree
	changeblock 18, 26, $36
.DoNothingToTheTree
	endcallback
	
ValenciaYoungsterScript:
	jumptextfaceplayer ValenciaYoungsterText
;	setflag ENGINE_POKEDEX
;	callasm CheatFillPokedex

PhoneCallScript: ;currently unused
	pause 10
	playsound SFX_CALL
	waitsfx
	pause 10
	playsound SFX_CALL
	waitsfx
	opentext
	writetext PhoneCallTest1
	waitsfx
	promptbutton
	writetext PhoneCallTest2
	promptbutton
	closetext
	checkevent EVENT_GOT_PIKACHU_FROM_IVY
	iftrue .GetPikachuDoll
	setevent EVENT_DECO_EEVEE_DOLL
	sjump .Continue
.GetPikachuDoll
	setevent EVENT_DECO_PIKACHU_DOLL
.Continue
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	end
	
PhoneCallTest1:
	text "… … …"
	line "A new message!"
	done
	
PhoneCallTest2:
	text "MOM: Hey kiddo!"
	line "LORI dropped your"
	cont "new DOLL off!"
	cont "She also got you"
	cont "something extra!"
	cont "Check your PC when"
	cont "you get home."
	done

; CheatFillPokedex:
	; ld a, 1
	; ld [wFirstUnownSeen], a
	; ld hl, wPokedexSeen
	; call .Fill
	; ld hl, wPokedexCaught
; .Fill:
	; ld a, %11111111
	; ld bc, 62 ; 001-248
	; call ByteFill
	; ld a, %11111111
	; ld bc, 31 ; 249-496
	; ret

ValenciaTechnologyGuyScript:
	jumptextfaceplayer ValenciaTechnologyGuyText	
	
ValenciaCrossScript:
	opentext
	writetext ValenciaCrossText1
	waitbutton
	showemote EMOTE_SHOCK, VALENCIA_ISLAND_CROSS, 15
	turnobject VALENCIA_ISLAND_CROSS, LEFT
	writetext ValenciaCrossText2
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, ValenciaCrossShovesYouMovement
	applymovement VALENCIA_ISLAND_CROSS, ValenciaCrossLeavingMovement
	setevent EVENT_MEET_SECRET_STARTER_REQS
	setevent EVENT_MET_CROSS_ON_VALENCIA
	disappear VALENCIA_ISLAND_CROSS
	end
	
ValenciaCrossText1:
	text "???: Hmph."
	line "It got away."
	
	para "Whatever, I'll get"
	line "something even"
	cont "better on the next"
	cont "island."
	done
	
ValenciaCrossText2:
	text "???: Huh?"
	line "You got a problem?"
	
	para "Get out of my way."
	done

ValenciaYoungsterText:
	text "Yo, <PLAYER>!"
	line "Take care on your"
	cont "travels!"
	done

ValenciaTechnologyGuyText:
	text "Technology is"
	line "incredible!"
	
	para "Now people can"
	line "make their own"
	cont "GAMEBOY games!"
	done
	
ValenciaLassScript:
	jumptextfaceplayer ValenciaLassText
	
ValenciaLassText:
	text "Splish! <PLAYER>!"
	line "I love the sound"
	cont "the water makes"
	cont "when I SPLASH in"
	cont "the puddles!"
	done
	
ASIvyScriptText1:
	text "IVY: I know a good"
	line "spot, follow me!"
	done
	
ASIvyScriptText2:
	text "IVY: In case you"
	line "didn't know, this"
	cont "is my house."
	
	para "My AIDES live with"
	line "me. You should"
	cont "chat with them at"
	cont "some point."
	done
	
ASIvyScriptText3:
	text "IVY: It's just a"
	line "tad bit further,"
	cont "<PLAYER>!"
	done
	
ASIvyScriptText4:
	text "IVY: Oh?"
	line "When did all this"
	cont "tall grass grow"
	cont "here?"
	
	para "Sorry, <PLAYER>!"
	line "I gotta check it"
	cont "out!"
	done

ASIvyScriptText5:
	text "IVY: Woah!"
	done
	
ReceivedAltStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done
	
ASIvyScriptText6:
	text "IVY: Wow! I can't"
	line "believe we found"
	cont "an EEVEE!"
	
	para "It's a very rare"
	line "#MON."
	
	para "It must be fate,"
	line "<PLAYER>. So, I"
	cont "entrust it to you!"
	done
	
ASIvyScriptText7:
	text "IVY: Well, it's"
	line "been quite the"
	cont "event today, huh!"
	
	para "I suppose we can"
	line "go back to the lab"
	cont "now. Follow me!"
	done
	
ASIvyScriptText8:
	text "IVY: Wow! I can't"
	line "believe we found"
	cont "a PIKACHU!"
	
	para "It's a very rare"
	line "#MON."
	
	para "It must be fate,"
	line "<PLAYER>. So, I"
	cont "entrust it to you!"
	done
	
ASIvyScriptText9:
	text "IVY: This is my"
	line "secret spot!"
	
	para "It's where I met"
	line "my partner #MON"
	cont "GYARADOS!"
	done
	
ASIvyScriptText10:
	text "IVY: Did you hear"
	line "that?! Let's go"
	cont "check it out!"
	done
	
ASIvyScriptText11:
	text "IVY: Wait a sec!"
	line "What is that!?"
	cont "It can't be…"
	cont "Is that a DRATINI?"
	done
	
ASIvyScriptText12:
	text "IVY: <PLAYER>,"
	line "this is a once in"
	cont "a lifetime chance!"
	cont "We have to catch"
	cont "it!"
	done
	
ASIvyScriptText13:
	text "IVY: Incredible!"
	line "I can't believe we"
	cont "caught a DRATINI!"
	
	para "It's known to be"
	line "near legendary in"
	cont "terms of rarity!"

	para "It must be fate,"
	line "<PLAYER>. So, I"
	cont "entrust it to you!"
	done
	
ASPlayerMovement1:
	step DOWN
	step_end
	
ASIvyMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
ASIvyMovement2:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ASIvyMovement3:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

ASIvyMovement4:
	step LEFT
	step LEFT
	step LEFT
	step_end

ASIvyMovement5:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
ASIvyMovement6:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
ASIvyMovement7:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step_end
	
ASIvyMovement8:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

ValenciaCrossShovesYouMovement:
	turn_head DOWN
	fix_facing
	jump_step UP
	remove_fixed_facing
	step_end
	
ValenciaCrossLeavingMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step LEFT
	step_end

ValenciaIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  5, PLAYERS_HOUSE_1F, 1
	warp_event  5, 19, VALENCIA_NEIGHBOR_HOUSE, 1
	warp_event 19, 15, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event 29, 13, IVYS_LAB, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ValenciaYoungsterScript, -1
	object_event 16, 18, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ValenciaTechnologyGuyScript, -1
	object_event 32,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ValenciaLassScript, -1
	object_event 29, 15, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALT_STARTER_VALENCIA_IVY
	object_event 30, 37, SPRITE_DRATINI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRATINI_VALENCIA_APPEAR
	object_event 43, 22, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ValenciaCrossScript, EVENT_MET_CROSS_ON_VALENCIA
