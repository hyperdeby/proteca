/*--------------------- DESENHO DO CORPO ---------------------*/
// Desenha corpo
draw_sprite_ext(spr_corpo, 0, x, y, escala_x, escala_y, 0, retCorPele(opcao_selecionada[0]), 1);

// Desenha calça
draw_sprite_ext(spr_calca, 0, x, y, escala_x, escala_y, 0, retCorCalca(opcao_selecionada[1]), 1);

// Desenha camiseta
draw_sprite_ext(spr_camiseta, opcao_selecionada[2], x, y, escala_x, escala_y, 0, c_white, 1);

// Desenha cabelo
draw_sprite_ext(spr_cabelo, opcao_selecionada[3], x, y, escala_x, escala_y, 0, retCorCabelo(opcao_selecionada[4]), 1);

/*--------------------- FIM DO DESENHO DO CORPO ---------------------*/

// variáveis para desenho das opções customização
var separacao_x = 20;
var inicio_x = x + largura_desenho/2 + separacao_x + 10;
var separacao_y = 36 * escala_y;
var inicio_y = 50;
var largura_botao = sprite_get_width(spr_botao) * escala_x;
var altura_botao = sprite_get_height(spr_botao) * escala_y;

/*--------------------- DESENHO DOS BOTÕES - MENU CUSTOMIZAÇÃO ---------------------*/
draw_set_font(fnt_customizacao);
draw_set_color(c_black);
var balpha = 1;	
var bcor = c_dkgray;

for (i = 0; i < num_atributos; i++) {
	if (menu_atual == 0)
		draw_sprite(spr_flecha, 0, inicio_x + largura_botao/2, inicio_y - 20);
	
	if (point_in_rectangle(mouse_x, mouse_y, inicio_x, inicio_y+(separacao_y*i), inicio_x+largura_botao, inicio_y+(separacao_y*i)+altura_botao)) {
		if (mouse_check_button_pressed(mb_left)) {
			menu_atual = 0;
			customizacao_selecionada = i;
		}
	}
	
	if (customizacao_selecionada == i)  {
		balpha = 1;
		bcor = c_dkgray;		
	} else { 
		balpha = 0.7;	
		bcor = c_gray;
	}
	
	draw_set_alpha(balpha);
	draw_sprite_ext(spr_botao, 0, inicio_x, inicio_y + (separacao_y*i), escala_x, escala_y, 0, bcor, balpha);
	draw_text_transformed(inicio_x+10, inicio_y+(separacao_y*i)+8, customizacao[i], escala_x, escala_y, 0);
	draw_set_alpha(1);
}

/*--------------------- DESENHO DOS BOTÕES - OPÇÕES EM UMA CUSTOMIZAÇÃO ---------------------*/
if (customizacao_selecionada != -1) {
	for (i = 0; i < array_length(atributo[customizacao_selecionada]); i++) {
		if (menu_atual == 1)
			draw_sprite(spr_flecha, 0, inicio_x+3*largura_botao/2+separacao_x, inicio_y - 20);
		
		if (point_in_rectangle(mouse_x, mouse_y, inicio_x+largura_botao+separacao_x, inicio_y+(separacao_y*i), inicio_x+2*largura_botao+separacao_x, inicio_y+(separacao_y*i)+altura_botao)) {		
			if (mouse_check_button_pressed(mb_left)) {
				menu_atual = 1;
				opcao_selecionada[customizacao_selecionada] = i;
			}
		}
	
		if (opcao_selecionada[customizacao_selecionada] == i) { 
			balpha = 1;
			bcor = c_dkgray;
		} else { 
			balpha = 0.7;
			bcor = c_gray;
		}
		
		draw_set_alpha(balpha);
		draw_sprite_ext(spr_botao, 0, inicio_x+largura_botao+separacao_x, inicio_y+(separacao_y*i), escala_x, escala_y, 0, bcor, balpha);
		draw_text_transformed(inicio_x+largura_botao+separacao_x+10, inicio_y+(separacao_y*i)+8, atributo[customizacao_selecionada, i], escala_x, escala_y, 0);
		draw_set_alpha(1);
	}
}

/*--------------------- DESENHO DO BOTÃO - CUSTOMIZAÇÃO FINALIZADA ---------------------*/
// camera padrão
var camera = view_camera[0];

// (x, y) de início da camera 0
var camera_x = camera_get_view_x(camera); 
var camera_y = camera_get_view_y(camera);

// altura e largura de início da camera 0
var largura_camera = camera_get_view_width(camera);
var altura_camera = camera_get_view_height(camera);

// Desenha e verifica o botão - se mouse está dentro, o deixa mais escuro (selecionado)
if (point_in_rectangle(mouse_x, mouse_y, camera_x+largura_camera-largura_botao-10, camera_y+altura_camera-altura_botao-30, camera_x+largura_camera-10, camera_y+altura_camera-30)) {
	balpha = 1;
	bcor = c_dkgray;
	if (mouse_check_button_pressed(mb_left)) 
		customizacaoFinalizada(opcao_selecionada);
} else {
	balpha = 0.7;
	bcor = c_gray;
}

// Desenha o texto do botão de acordo com ele estar ou não selecionado
draw_set_alpha(balpha);	
draw_sprite_ext(spr_botao, 0, camera_x+largura_camera-largura_botao-10, camera_y+altura_camera-altura_botao-30, escala_x, escala_y, 0, bcor, balpha);
draw_text_transformed(camera_x+largura_camera-largura_botao+2, camera_y+altura_camera-altura_botao-21, "Pronto!", escala_x, escala_y, 0);
draw_set_alpha(1);

// Desenha o texto que indica o botão de finalização no teclado
draw_text(camera_x+largura_camera-3*string_width("Enter para finalizar")/2, camera_y+altura_camera-25, "Enter para finalizar");

// Seta tudo para o padrão novamente
draw_set_color(-1);
draw_set_font(-1);
