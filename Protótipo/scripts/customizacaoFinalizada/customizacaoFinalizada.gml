function customizacaoFinalizada(opcao_selecionada){
	var player_instance;

	if (instance_number(obj_player) == 0) {
		player_instance = instance_create_layer(0, 0, "Instances",obj_player);
	} else {
		player_instance = instance_find(obj_player, 0);
	}
	
	player_instance.x = x;
	player_instance.y = y;
	player_instance.cabelo = opcao_selecionada[3];
	player_instance.cor_cabelo = opcao_selecionada[4];
	player_instance.camiseta = opcao_selecionada[2];
	player_instance.cor_calca = opcao_selecionada[1];
	player_instance.cor_corpo = opcao_selecionada[0];

	room_goto_next();
	instance_destroy();
}