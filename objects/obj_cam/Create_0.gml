
view_target = obj_player

view_spd = 0.5

resolution_width = display_get_width()
resolution_height = display_get_height()
resolution_scale = 1.7

global.view_width = resolution_width / resolution_scale
global.view_height = resolution_height / resolution_scale

window_set_size(global.view_width * resolution_scale, global.view_height * resolution_scale)
surface_resize(application_surface, global.view_width * resolution_scale, global.view_height * resolution_scale)
