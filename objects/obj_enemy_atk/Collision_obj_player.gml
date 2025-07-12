
var _dir = point_direction(x, y, other.x, other.y)

with(obj_player){
	knockback_dir = _dir
	if (state != scr_player_knockback && can_damage){
		knockback_force = other.knockback_force
	}
	state = scr_player_knockback
	alarm[0] = 10

	if (can_damage){
		life -= other.damage
		can_damage = false
	}
}