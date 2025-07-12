/// @description Damage Casa

with (obj_house){
	if (can_damage){
		life -= other.damage
		alarm[0] = 30
		can_damage = false
	}
}

