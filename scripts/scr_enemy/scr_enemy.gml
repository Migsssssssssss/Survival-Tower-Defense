
function scr_check_target(){
	if (distance_to_object(target) <= range_attack){
		
		state = scr_enemy_attack
	} else {
		state = scr_enemy_go_target
	}
}

function scr_enemy_go_target(){
	
	
	scr_check_target()

		var _dir = point_direction(x, y, target.x, target.y)
	
		hspd = lengthdir_x(max_spd, _dir)
		vspd = lengthdir_y(max_spd, _dir)
}

function scr_enemy_attack(){
	
	hspd = 0 
	vspd = 0 

	if (!attack){
		
		var _inst = instance_create_layer(x, y, layer, obj_enemy_atk)
		var _dir_atk = point_direction(x, y, target.x, target.y)
	
		_inst.image_angle = _dir_atk
		
		var _dist = 40; // distância do centro
		_inst.x = x + lengthdir_x(_dist, _dir_atk);
		_inst.y = y + lengthdir_y(_dist, _dir_atk);
		
		_inst.damage = damage
		_inst.knockback_force = force
		
		_inst.image_xscale = 2
		_inst.image_yscale = 2
		
		atk_cooldown = atk_cooldown_max * room_speed
		attack = true
	}
	
	if (atk_cooldown > 0){
		atk_cooldown --;
	} else {
		
		attack = false;
	}

	
	if (!instance_exists(target) || distance_to_object(target) > range_attack){
		attack = false
	    state = scr_enemy_go_target;
	}

}

function scr_enemy_knockback(){
	
	knockback_force = lerp(knockback_force, 0, 0.05)
	
	hspd = lengthdir_x(knockback_force, knockback_dir)
	vspd = lengthdir_y(knockback_force, knockback_dir)
	
}