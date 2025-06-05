/// @description menu
draw_set_font(fntMenu)

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

var guiHalfWidth = display_get_gui_width()/2
var guiHalfHeight = display_get_gui_height()/2
var strHeight = string_height("A") // 'A' foi usado porque qualquer letra tem o mesmo tamanho maximo

for (var i = 0; i < numOptions; i++) {
	var strHalfWidth = string_width(options[i]) / 2
	
	// Determina o ponto (x1, y1): centralizado horizontalmente, na metade de baixo da tela
	var x1 = guiHalfWidth - strHalfWidth;
	var y1 = guiHalfHeight - strHeight/2 + (i * strHeight)

	// Determina o ponto (x2, y2)
	var x2 = guiHalfWidth + strHalfWidth;
	var y2 = guiHalfHeight + strHeight/2 + (i * strHeight)

	// Verifica se a opção atual foi selecionada pelo mouse
	if (point_in_rectangle(mx, my, x1, y1, x2, y2)) {
		selectedOption = i
		if (mouse_check_button_pressed(mb_left))
			menuSelection(selectedOption)
	}
	
	// Verifica se a opção atual foi selecionada pelo teclado
	if (keyboard_check_pressed(vk_enter))
		menuSelection(selectedOption)
	
	// Destaca a opção selecionada
	if (selectedOption == i) {
		draw_set_alpha(1)
	} else {
		draw_set_alpha(.7)
	}
		
	
	draw_text(x1, y1, options[i])
}

draw_set_font(-1)