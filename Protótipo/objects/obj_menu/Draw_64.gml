draw_set_font(fnt_menu);

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var x_meio_gui = display_get_gui_width() / 2;
var y_meio_gui = display_get_gui_height() / 2;
var altura_str = string_height("A");

for (var i = 0; i < num_opcoes; i++) { 
	var x_meio_str = string_width(opcoes[i]) / 2;
	
	var x1 = x_meio_gui - x_meio_str;    
	var y1 = y_meio_gui - altura_str/2 + (i * altura_str);
	var x2 = x_meio_gui + x_meio_str;
	var y2 = y_meio_gui + altura_str/2 + (i * altura_str);
	
	if (point_in_rectangle(mx, my, x1, y1, x2, y2)) { 
		index = i;
	
		if (mouse_check_button_pressed(mb_left))
			selecaoMenu(index);
	}
	
	if (keyboard_check_pressed(vk_enter))
		selecaoMenu(index);
	
	if (index == i) { 
		draw_set_color(c_yellow);
		draw_set_alpha(1);
	} else { 
		draw_set_color(c_white);	
		draw_set_alpha(0.7);
	}
	
	draw_text(x1, y1, opcoes[i]);
}

draw_set_font(-1);
draw_set_color(-1);