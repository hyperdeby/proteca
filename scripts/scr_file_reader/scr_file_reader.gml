/// @description Função que extrai os diálogos de um arquivo JSON e retorna um array de structs de diálogos
/// @param _file_name Nome do arquivo que contém os diálogos
/// @param _func Função que deve ser passada para fazer o parsing do arquivo, normalmente a função json_parse
function import_json(_file_name, _func)
{
	if (file_exists(_file_name))
	{
		var _file, _json_string;
		_file = file_text_open_read(_file_name);
		_json_string = "";
		while (!file_text_eof(_file))
		{
			_json_string += file_text_readln(_file);
		}
		file_text_close(_file);
		return script_execute(_func, _json_string);
	}
	return undefined;
}
