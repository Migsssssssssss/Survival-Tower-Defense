/// @description Dar Dano

var _dir = point_direction(x, y, other.x, other.y)

other.knockback_dir = _dir
if (other.state != scr_enemy_knockback){
	other.knockback_force = knockback_force / other.weight //(peso)
}
other.state = scr_enemy_knockback
other.alarm[1] = 5

instance_destroy()
other.life -= damage