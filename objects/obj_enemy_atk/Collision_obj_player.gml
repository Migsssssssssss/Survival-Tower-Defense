
var _dir = point_direction(x, y, other.x, other.y)

other.knockback_dir = _dir
if (other.state != scr_player_knockback && other.can_damage){
	other.knockback_force = knockback_force
}
other.state = scr_player_knockback
other.alarm[0] = 10

if (other.can_damage){
	other.life -= damage
	other.can_damage = false
}