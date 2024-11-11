if (menu_atual == 0) { // lida com as opções de atributos
	customizacao_selecionada++;
	if (customizacao_selecionada >= num_atributos)	
		customizacao_selecionada = 0;
} else if (menu_atual == 1) { // lida com a opção selecionada no atributo atual
	opcao_selecionada[customizacao_selecionada]++;
	if (opcao_selecionada[customizacao_selecionada] >=  array_length(atributo[customizacao_selecionada]))
		opcao_selecionada[customizacao_selecionada] = 0;
}