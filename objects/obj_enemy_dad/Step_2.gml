/// @description Colisão

if (global.pause) exit

var move_steps = ceil(point_distance(0, 0, hspd, vspd));

for (var i = 0; i < move_steps; i++) {
	var x_step = hspd / move_steps;
	var y_step = vspd / move_steps;

	if (!place_meeting(x + x_step, y, obj_block)) {
		x += x_step;
	} else {
		hspd = 0;
	}

	if (!place_meeting(x, y + y_step, obj_block)) {
		y += y_step;
	} else {
		vspd = 0;
	}
}

