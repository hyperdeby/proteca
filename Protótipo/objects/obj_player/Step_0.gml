#region Movimentação

velocidade_y += 0.1;
velocidade_x = 0;
if keyboard_check (vk_left) {
	velocidade_x =- 4.2;
}
if keyboard_check (vk_right) {
	velocidade_x =+ 4.2;
}
if place_meeting (x, y + 1, obj_solido) {
	velocidade_y = 0;
	
	if keyboard_check (vk_up) {
		velocidade_y =- 4;	
	}
}
move_and_collide(velocidade_x, velocidade_y, obj_solido);

#endregion

#region FimDaFase
if place_meeting(x, y, obj_flag) {
	// salvamento
	
	// deleta o save anterior
	if (file_exists("save.ini"))
		file_delete("save.ini");
		
	ini_open("save.ini");
	
	// verifica se eh a ultima sala
	if (room_next(room) == -1) {
		show_message("Você completou o jogo!");
		instance_destroy();
		room_goto(0);
		
		ini_write_real("Player","room", 0);
		
		ini_close();
	} else {
		// inicio da fase
		ini_write_real("Player","x_atual", 48);
		ini_write_real("Player","y_atual", 112);
		ini_write_real("Player","room", real(room_next(room)));
		ini_write_real("Player","nivel", ++nivel);
		ini_write_real("Player", "vida", 100);
        ini_write_real("Player", "pontos", pontos);
		ini_write_real("Player", "cabelo", cabelo);
		ini_write_real("Player", "cor_cabelo", cor_cabelo);
		ini_write_real("Player", "camiseta", camiseta);
		ini_write_real("Player", "cor_calca", cor_calca);
		ini_write_real("Player", "cor_corpo", cor_corpo);
		
		pontos += 10;
		
		ini_write_real("Player","pontos", pontos);
		
		ini_close();
		
		show_message("Vida: " + string(vida) + "\nPontos: " + string(pontos) + "\nNível: " + string(nivel));
		
		room_goto_next();
	}
}
#endregion

#region ColisaoComEspinho
if place_meeting(x, y, obj_espinho) {
	if (file_exists("save.ini"))
		file_delete("save.ini");
		
	ini_open("save.ini");
	
	vida -= 10;
	
	if (vida == 0) {
		vida = 100;	
		room_restart();
	}
	
	ini_close();
}
#endregion