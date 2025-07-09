
if (global.pause) exit

state()

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