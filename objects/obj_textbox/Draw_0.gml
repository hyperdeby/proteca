/// @description Evento responsável por preparar o texto para ser exibido, caso ainda não esteja pronto, e desenhar a caixa de diálogos

var _accept_key = keyboard_check_pressed(vk_space);

var _textbox_x = camera_get_view_x(view_camera[0]);
var _textbox_y = camera_get_view_y(view_camera[0]) + 144;

// Setup
if setup == false
{
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// loop through the pages
	for(var _p = 0; _p < page_number; _p++)
	{
		// find how many characters are on each page and store that number in the text_lengh array
		text_length[_p] = string_length(text[_p]);
		// get the x position for the textbox
		// no charaacter (center the textbox)
		//text_x_offset[_p] = 0;
		
		// setting individual characters and finding where the lines of text should break
		for (var _c = 0; _c < text_length[_p]; _c++)
		{
			// helper just to dont be confused with array index 
			var _char_pos = _c+1;
			// store individual characters in the char array
			char[_c,_p] = string_char_at(text[_p],_char_pos);
			// get current width of the line
			var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[_c,_p]);
			// get the last free space
			if char[_c,_p] == " "
				last_free_space = _char_pos + 1;
			// get the line breaks
			if _current_txt_w - line_break_offset[_p] > line_width
			{
				line_break_pos[line_break_offset[_p]] = last_free_space;
				line_break_num[_p]++;
				var _txt_up_to_last_space = string_copy(text[_p], 1, last_free_space -1);
				line_break_offset[_p] = string_width(_txt_up_to_last_space);
			}
		}
		
		// getting each characters coordinates
		for (var _c = 0; _c < text_length[_p]; _c++)
		{
			var _char_pos = _c+1;
			var _txt_x = _textbox_x + textbox_x_offset + border;
			var _txt_y = _textbox_y + border;
			// get current width of the line
			var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[_c,_p]);
			var _txt_line = 0;
			// compensate for string breaks
			for (var _lb = 0; _lb < line_break_num[_p]; _lb++)
			{
				// if the current looping character is after a line break
				if _char_pos >= line_break_pos[_lb,_p]
				{
					var _str_copy = string_copy(text[_p], line_break_pos[_lb,_p], _char_pos - line_break_pos[_lb,_p]);
					_current_txt_w = string_width(_str_copy);
					// record the line this character should be on
					_txt_line = _lb + 1;	// since _lb starts at 0
				}
			}
			// add to the x and y coordinates base on the new info
			char_x[_c,_p] = _txt_x + _current_txt_w;
			char_y[_c,_p] = _txt_y + _txt_line*line_sep;
		}
	}
}

// typing the text
if draw_char < text_length[page]
{
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

// flip through pages
if _accept_key
{
	// if the typing is done
	if draw_char == text_length[page]
	{
		// next page
		if page < page_number - 1
		{
			page++;
			draw_char = 0;
		}
		// destroy textbox
		else
		{
			// link text for options
			if option_number > 0
			{
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();
		}
	}
	// if not done typing
	else
	{
		draw_char = text_length[page];
	}
}


// draw textbox
var _txtb_x = _textbox_x + textbox_x_offset;
var _txtb_y = _textbox_y;
var _textbox_spr_w = sprite_get_width(textbox_spr);
var _textbox_spr_h = sprite_get_height(textbox_spr);
draw_sprite_ext(textbox_spr,0,_txtb_x, _txtb_y, textbox_width/_textbox_spr_w, textbox_height/_textbox_spr_h, 0, c_white, 1);

// options
if draw_char == text_length[page] && page == page_number - 1
{
	// option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0 ,option_number-1);
	
	// draw the options
	var _op_space = 22;
	var _op_border = border;
	var _op_shift = sprite_get_width(spr_textbox_arrow) + 3;
	for (var _op = 0; _op < option_number; _op++)
	{
		// draw the option box
		var _op_w = string_width(option[_op]) + _op_border*2;
		if option_pos != _op
			draw_sprite_ext(textbox_spr,0, _txtb_x + _op_shift, _txtb_y - _op_space*option_number + _op_space*_op, _op_w/_textbox_spr_w, (_op_space - 1)/_textbox_spr_h,0,c_white,0.6);
		
		// draw the arrow
		if option_pos == _op
		{
			draw_sprite(spr_textbox_arrow, 0, _txtb_x, _txtb_y - _op_space*option_number + _op_space*_op + 2);
			draw_sprite_ext(textbox_spr,0, _txtb_x + _op_shift, _txtb_y - _op_space*option_number + _op_space*_op, _op_w/_textbox_spr_w, (_op_space - 1)/_textbox_spr_h,0,c_white,1);
		}
		
		// draw option text
		draw_text(_txtb_x + _op_border + _op_shift, _txtb_y - _op_space*option_number + _op_space*_op + 2, option[_op]);
	}
}

// draw the text
for (var _c = 0; _c < draw_char; _c++)
{
	draw_text(char_x[_c,page], char_y[_c,page], char[_c,page]);
}
