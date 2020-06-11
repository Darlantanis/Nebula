var/list/all_robolimbs = list()
var/list/chargen_robolimbs = list()
var/datum/robolimb/basic_robolimb

/proc/populate_robolimb_list()
	basic_robolimb = new()
	for(var/limb_type in typesof(/datum/robolimb))
		var/datum/robolimb/R = new limb_type()
		all_robolimbs[R.company] = R
		if(!R.unavailable_at_chargen)
			chargen_robolimbs[R.company] = R

#define DEFINE_ROBOLIMB_DESIGNS(MODEL_PATH, MODEL_ID, MODEL_NAME)         \
/datum/fabricator_recipe/robotics/prosthetic/model_##MODEL_ID {           \
	category = MODEL_NAME + " Prosthetics";                               \
	path = /obj/item/organ/external/leg;                                  \
	model = MODEL_PATH;                                                   \
}                                                                         \
/datum/fabricator_recipe/robotics/prosthetic/model_##MODEL_ID/right_leg { \
	path = /obj/item/organ/external/leg/right;                            \
}                                                                         \
/datum/fabricator_recipe/robotics/prosthetic/model_##MODEL_ID/left_arm {  \
	path = /obj/item/organ/external/arm;                                  \
}                                                                         \
/datum/fabricator_recipe/robotics/prosthetic/model_##MODEL_ID/right_arm { \
	path = /obj/item/organ/external/arm/right;                            \
}                                                                         \
/datum/fabricator_recipe/robotics/prosthetic/model_##MODEL_ID/head {      \
	path = /obj/item/organ/external/head;                                 \
}                                                                         \
/datum/fabricator_recipe/robotics/prosthetic/model_##MODEL_ID/chest {     \
	path = /obj/item/organ/external/chest;                                \
}                                                                         \
/datum/fabricator_recipe/robotics/prosthetic/model_##MODEL_ID/groin {     \
	path = /obj/item/organ/external/groin;                                \
}

/datum/robolimb
	var/company = "Unbranded"                                 // Shown when selecting the limb.
	var/desc = "A generic unbranded robotic prosthesis."      // Seen when examining a limb.
	var/icon = 'icons/mob/human_races/cyberlimbs/robotic.dmi' // Icon base to draw from.
	var/unavailable_at_chargen                                // If set, not available at chargen.
	var/can_eat
	var/has_eyes = TRUE
	var/can_feel_pain
	var/skintone
	var/limb_blend
	var/list/bodytypes_cannot_use = list()
	var/list/species_restricted
	var/list/applies_to_part = list() //TODO.
	var/list/allowed_bodytypes = list(BODYTYPE_HUMANOID)
	var/modifier_string = "robotic"
	var/hardiness = 1
	var/manual_dexterity = DEXTERITY_FULL
	var/movement_slowdown = 0
	var/is_robotic = TRUE

/datum/robolimb/wooden
	company = "wooden prosthesis"
	desc = "A crude wooden prosthetic."
	icon = 'icons/mob/human_races/cyberlimbs/morgan/morgan_main.dmi'
	modifier_string = "wooden"
	hardiness = 0.75
	manual_dexterity = DEXTERITY_SIMPLE_MACHINES
	movement_slowdown = 1
	is_robotic = FALSE
