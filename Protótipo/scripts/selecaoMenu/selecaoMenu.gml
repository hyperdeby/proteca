function selecaoMenu(index){
	switch (index) { 	
	
	// Novo jogo
	case 0:
		ini_open("save.ini");
        ini_write_real("Player", "x_atual", 48);
        ini_write_real("Player", "y_atual", 112);
        ini_write_real("Player", "vida", 100);
        ini_write_real("Player", "pontos", 0);
        ini_write_real("Player", "nivel", 1);
        ini_write_real("Player", "room", 1);
		ini_write_real("Player", "cabelo", 0);
		ini_write_real("Player", "cor_cabelo", 0);
		ini_write_real("Player", "camiseta", 0);
		ini_write_real("Player", "cor_calca", 0);
		ini_write_real("Player", "cor_corpo", 0);
        ini_close();
        room_goto(1);
		break;
	
	// Carregar jogo
	case 1:
		ini_open("save.ini");
		var saved_room = ini_read_real("Player", "room", -1);
        var saved_x = ini_read_real("Player", "x_atual", 48);
		var saved_y = ini_read_real("Player", "x_atual", 112);
		var saved_vida = ini_read_real("Player", "vida", 100);
        var saved_pontos = ini_read_real("Player", "pontos", 0);
        var saved_nivel = ini_read_real("Player", "nivel", 1);
		var saved_cabelo = ini_read_real("Player", "cabelo", 0);
		var saved_cor_cabelo = ini_read_real("Player", "cor_cabelo", 0);
		var saved_camiseta = ini_read_real("Player", "camiseta", 0);
		var saved_cor_calca = ini_read_real("Player", "cor_calca", 0);
		var saved_cor_corpo = ini_read_real("Player", "cor_corpo", 0);
		ini_close();
        
		var player_instance;
		if (instance_number(obj_player) == 0) {
			player_instance = instance_create_layer(0, 0, "Instances",obj_player);
		} else {
			player_instance = instance_find(obj_player, 0);
		}
	
		player_instance.x = saved_x;
		player_instance.y = saved_y;
		player_instance.cabelo = saved_cabelo;
		player_instance.cor_cabelo = saved_cor_cabelo;
		player_instance.camiseta = saved_camiseta;
		player_instance.cor_calca = saved_cor_calca;
		player_instance.cor_corpo = saved_cor_corpo;
		
		
		
		if (saved_room != -1) 
            room_goto(saved_room);
		
		
		break;
	
	// Fechar jogo
	case 2:
		game_end();
		break;
	}
}