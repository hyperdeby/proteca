function retCorPele(cor_pele){
	if (cor_pele == 0)
		return(make_colour_rgb(179, 139, 109));
	
	if (cor_pele == 1)
		return(make_colour_rgb(79, 44, 29));

	return(make_colour_rgb(0, 0, 0));
}