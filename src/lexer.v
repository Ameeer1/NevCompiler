enum TokenType {
	number
	texts
	identifier
	variable
	constant
	function_sign
	public_sign
	enum_sign
	tag_sign
	class_sign
	if_sign
	else_sign
	match_sign
	return_sign
	equal_to
	greater_than_or_equal_to
	less_than_or_equal_to
	greater_than
	less_than
	equal
	binary_operator
	open_round_bracket
	close_round_bracket
	open_curly_bracket
	close_curly_bracket
	open_square_bracket
	close_square_bracket
}
struct Token {
	start u16
  end u16
	value string
	token_type TokenType
}

struct LexerInfo {
	ignore []string = ['\r', '\n', ' ']
	dictionary map[string]TokenType = {
		"var": .variable
		"val": .constant
		"fun": .function_sign
		"pub": .public_sign
		"enum": .enum_sign
		"tag": .tag_sign
		"class": .class_sign
		"if": .if_sign
		"else": .else_sign
		"match": .match_sign
		"return": .return_sign
		"==": .equal_to
		">=": .greater_than_or_equal_to
		"<=": .less_than_or_equal_to
		">": .greater_than
		"<": .less_than
		"=": .equal
		"+": .binary_operator
		"-": .binary_operator
		"/": .binary_operator
		"*": .binary_operator
		"^": .binary_operator
		"(": .open_round_bracket
		")": .close_round_bracket
		"{": .open_curly_bracket
		"}": .close_curly_bracket
		"[": .open_square_bracket
		"]": .close_square_bracket
	}
}

fn tokenize(source string) []Token {
	result := []Token{}
	code := source.runes()
	for i in 0..code.len {
		print(code[i])
	}
	return result
}
