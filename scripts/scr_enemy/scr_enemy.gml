
function scr_enemy_go_target(){
	
	if (!attack){
		var _dir = point_direction(x, y, target.x, target.y)
	
		hspd = approach(hspd, lengthdir_x(spd, _dir), acc)
		vspd = approach(vspd, lengthdir_y(spd, _dir), acc)
	}
	
	
	
}

function scr_enemy_attack(){
	
	
	
}

function scr_enemy_knockback(){
	
	knockback_force = lerp(knockback_force, 0, 0.05)
	
	hspd = lengthdir_x(knockback_force, knockback_dir)
	vspd = lengthdir_y(knockback_force, knockback_dir)
	
}