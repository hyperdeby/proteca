function retCorCalca(cor_calca){
	if (cor_calca == 0) 
		return(make_colour_rgb(30, 30, 30));
	
	if (cor_calca == 1)
		return(make_colour_rgb(5, 100, 5));

	return(make_colour_rgb(0, 0, 0));
}