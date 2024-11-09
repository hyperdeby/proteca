/// @description Função que aplica algumas configurações para os textos das caixas de diálogo
function scr_set_defaults_for_text()
{
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
}

/// @description Função que copia o texto para ser usado internamente na caixa de diálogos
/// @param _text Texto que será copiado
function scr_text(_text)
{
	scr_set_defaults_for_text();
	text[page_number] = _text;	
	page_number++;
}

/// @description Função que copia a opção para ser usado internamente na caixa de diálogos
/// @param _option Texto da opção que será copiada
/// @param _link_id Identificador do próximo texto que deve ser usado caso a opção seja escolhida
function scr_option(_option, _link_id)
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;	
	option_number++;
}


/// @description Função que pega os textos da variável global.dialogos e passa para a caixa de diálogos
/// @param _text_id Identificador da seção do texto que deve ser usada pela função
function scr_game_text(_text_id){
	//show_debug_message("dialogos tem tamanho: " + array_length(global.dialogos));
	for (var _i = 0; _i < array_length(global.dialogos); _i++)
	{
		if (global.dialogos[_i].Text_Id == _text_id)
		{
			for(var _j = 0; _j < array_length(global.dialogos[_i].Lines); _j++)
			{
				scr_text(global.dialogos[_i].Lines[_j]);
			}
			if (variable_struct_exists(global.dialogos[_i],"Options"))
			{
				if (array_length(global.dialogos[_i].Options) > 0)
				{
					for(var _j = 0; _j < array_length(global.dialogos[_i].Options); _j++)
					{
						scr_option(global.dialogos[_i].Options[_j][0],global.dialogos[_i].Options[_j][1]);
					}			
				}
			}
			break;
		}		
	}	
}

/// @description Função que cria a caixa de diálogos
/// @param _text_id Identificador da seção de texto que deve ser usada pela função
function create_textbox(_text_id)
{
	with( instance_create_depth(0,0,-999,obj_textbox) )
	{
		scr_game_text(_text_id);		
	}
}