/// @description Desenha a pausa (o botão ou o menu)
draw_set_font(fntMenu)

// (x,y) do mouse
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

// Variáveis usadas como auxiliares para desenho
var guiHalfWidth = display_get_gui_width()/2
var guiHalfHeight = display_get_gui_height()/2
var strHeight = string_height("A") // 'A' foi usado porque qualquer letra tem o mesmo tamanho maximo

// Variáveis usadas para desenhar o botão de pausa
var pauseButtonHalfWidth = sprite_get_width(sprPauseButton)/2
var pauseButtonHalfHeight = sprite_get_height(sprPauseButton)/2 
global.xPauseButton = guiHalfWidth
global.yPauseButton = pauseButtonHalfHeight + 5

// Se o jogo não está pausado, desenha o botão de pause
if (!global.pause) {
	draw_sprite(sprPauseButton, -1, global.xPauseButton, global.yPauseButton)
	if (point_in_rectangle(mx, my, global.xPauseButton-pauseButtonHalfWidth, global.yPauseButton-pauseButtonHalfHeight, global.xPauseButton+pauseButtonHalfWidth, global.yPauseButton+pauseButtonHalfHeight)) {
		draw_set_alpha(1)
		if (mouse_check_button_pressed(mb_left)) {
			global.pause = true
		}
	} else {
		draw_set_alpha(.7)
	}
	exit
}

// Se o jogo está pausado, desenha as opções do menu de pausa
draw_set_alpha(.8)
draw_set_color(c_black)
draw_rectangle(0,0,guiHalfWidth*2,guiHalfHeight*2, false)
draw_set_alpha(1)
draw_set_color(c_white)
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
			pauseSelection(selectedOption)
	}
	
	// Verifica se a opção atual foi selecionada pelo teclado
	if (keyboard_check_pressed(vk_enter))
		pauseSelection(selectedOption)
	
	// Destaca a opção selecionada
	if (selectedOption == i) {
		draw_set_alpha(1)
	} else {
		draw_set_alpha(.7)
	}
		
	
	draw_text(x1, y1, options[i])
}

draw_set_font(-1)
