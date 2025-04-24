/// @description Muda seleção dentro de um menu
if (currentMenu == 0) { 
	
	selectedPart--;
	if (selectedPart < 0)	
		selectedPart = numFeatures-1;
		
} else if (currentMenu == 1) { // lida com a opção selecionada no atributo atual
	
	selectedFeature[selectedPart]--;
	if (selectedFeature[selectedPart] < 0)
		selectedFeature[selectedPart] = array_length(feature[selectedPart])-1;

}