#region characterDrawing

// desenha o personagem
draw_sprite_ext(sprHair, selectedFeature[0], x, y, xScale, yScale, 0, -1, 1)
draw_sprite_ext(sprBlouses, selectedFeature[1], x, y, xScale, yScale, 0, -1, 1)
draw_sprite_ext(sprPants, selectedFeature[2], x, y, xScale, yScale, 0, -1, 1)
draw_sprite_ext(sprShoes, selectedFeature[3], x, y, xScale, yScale, 0, -1, 1)
draw_sprite_ext(sprAccessories, selectedFeature[4], x, y, xScale, yScale, 0, -1, 1)

#endregion

#region buttonVariables

// variaveis usadas para posicionamento de botoes e de escrita
var xButtonMenu = 4
var yButton = 44
var buttonWidth = sprite_get_width(sprButton)
var buttonHeight = sprite_get_height(sprButton)
var yDisplacement = 80

#endregion

#region buttonDrawing

// define cor e fonte das opcoes
draw_set_font(fntCustomization)
draw_set_color(c_black)

var xButtonOptions = room_width - buttonWidth - 20

// se o menu selecionado for o de partes do corpo, desenha a flecha
if (currentMenu == 0) {
	draw_sprite(sprArrow, 0, xButtonMenu+(buttonWidth-sprite_get_width(sprArrow))/2, yButton-35)
}
// se o menu selecionado for o de opções dentro de uma parte do corpo, desenha a flecha
else {
	draw_sprite(sprArrow, 0, xButtonOptions+(buttonWidth-sprite_get_width(sprArrow))/2 ,yButton-35)
}

// loop que desenha botoes e opcoes
for (var i = 0; i < array_length(feature); i++) {	
	// desenha o botao
	draw_sprite_ext(sprButton, 0, xButtonMenu, yButton+(yDisplacement*i), 1, 1, 0, -1, 1)

	// (x, y) para string ficar centralizada no botao
	var xStr = xButtonMenu+(buttonWidth-string_width(part[i]))/2
	var yStr = yButton+(buttonHeight-string_height(part[i]))/2+(yDisplacement*i)

	// escreve a opcao
	draw_text(xStr, yStr, part[i])
	
	// verifica se o botao atual esta selecionado
	if (point_in_rectangle(mouse_x, mouse_y, xButtonMenu, yButton+(yDisplacement*i), xButtonMenu+buttonWidth, yButton+(yDisplacement*i)+buttonHeight)) {		
		// se selecionado, verifica se foi pressionado
		if (mouse_check_button_pressed(mb_left)) {
			selectedPart = i
			currentMenu = 0
		}
	}
	
	if (selectedPart == i) {
		draw_set_color(c_white)
		draw_set_alpha(.5)
		draw_rectangle(xButtonMenu, yButton+(yDisplacement*i), xButtonMenu+buttonWidth, yButton+(yDisplacement*i)+buttonHeight, false)
		draw_set_color(c_black)
		draw_set_alpha(1)
	}
}

for (var i = 0; i < array_length(feature[selectedPart]); i++) {
	
	// desenha o botao
	draw_sprite_ext(sprButton, 0, xButtonOptions, yButton+(yDisplacement*i), 1, 1, 0, -1, 1)
	
	// (x, y) para string ficar centralizada no botao
	var xStr = xButtonOptions+(buttonWidth-string_width(feature[selectedPart, i]))/2
	var yStr = yButton+(buttonHeight-string_height(feature[selectedPart, i]))/2+(yDisplacement*i)	

	// escreve a opcao
	draw_text(xStr, yStr, feature[selectedPart, i])
	
	// verifica se o botao atual esta selecionado
	if (point_in_rectangle(mouse_x, mouse_y, xButtonOptions, yButton+(yDisplacement*i), xButtonOptions+buttonWidth, yButton+(yDisplacement*i)+buttonHeight)) {
		
		// se selecionado, verifica se foi pressionado
		if (mouse_check_button_pressed(mb_left)) {
			selectedFeature[selectedPart] = i
			currentMenu = 1
		}
	}
	
	if (selectedFeature[selectedPart] == i) {
		draw_set_color(c_white)
		draw_set_alpha(.5)
		draw_rectangle(xButtonOptions, yButton+(yDisplacement*i), xButtonOptions+buttonWidth, yButton+(yDisplacement*i)+buttonHeight, false)
		draw_set_color(c_black)
		draw_set_alpha(1)
	}
}

// reseta cor e fonte
draw_set_font(-1)
draw_set_color(-1)

#endregion