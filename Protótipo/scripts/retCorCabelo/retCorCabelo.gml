function retCorCabelo(cor_cabelo){
	if (cor_cabelo == 0)  
		return(make_colour_rgb(55, 55, 55));
		
	if (cor_cabelo == 1)
		return(make_colour_rgb(124, 58, 0));
		
	if (cor_cabelo == 2)
		return(make_colour_rgb(238, 173, 45));

	return(make_colour_rgb(0, 0, 0));
}