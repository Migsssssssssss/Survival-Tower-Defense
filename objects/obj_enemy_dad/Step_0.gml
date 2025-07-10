
if (global.pause) exit

state()

// EMPURRÃO SUAVE ENTRE INIMIGOS USANDO HSPD E VSPD

var push_dist = 32; // distância mínima
var push_strength = 0.2; // força do empurrão

with (obj_enemy_dad) {
    if (id != other.id) {
        var dx = x - other.x;
        var dy = y - other.y;
        var dist = point_distance(x, y, other.x, other.y);
        
        if (dist < push_dist && dist != 0) {
            var overlap = push_dist - dist;
            var dir = point_direction(other.x, other.y, x, y);
            
            hspd += lengthdir_x(overlap * push_strength, dir);
            vspd += lengthdir_y(overlap * push_strength, dir);
        }
    }
}



if (look_target){
	if (x > target.x){
		image_xscale = -1
	} else {
		image_xscale = 1
	}
}

if (life <= 0){
	instance_destroy()
}