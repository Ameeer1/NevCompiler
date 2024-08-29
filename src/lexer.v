enum TokenType {
	number
	text
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
	open_scope
	dot
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
	start int
  end int
	value string
	token_type TokenType
}

struct LexerInfo {
	ignore []rune = "\r\n ".runes()

	num_chars []rune = "1234567890".runes()
	num_signs []rune = "_.".runes()

	alphabet []rune = "abcdefghijklmnopqrstuvwxyz".runes()

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
		".": .dot
		"->": .open_scope
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

fn tokenize(code string) []Token {
	mut result := []Token{}
	lexer_info := LexerInfo {}
	//code := source.runes()
	mut i := 0

	in_code: for {
		//check if its not impodtant character or no
		for skipable in lexer_info.ignore {
			if skipable == code[i] {
				i += i
				continue in_code
			}
		}

		// compare with keywords
		for key in lexer_info.dictionary.keys() {
			if code[i..i + key.len] == key {
				result << Token {
					start: i
					end: i + key.len
					value: code[i..i + key.len]
					token_type: lexer_info.dictionary[key]
				}
				i += key.len
				continue in_code
			}
		}

		// habdle identifier
		mut text := ""
		mut txt_char_index := 1
		if code[i] in lexer_info.alphabet {
			text += code[i].str()
			in_text: for {
				if (code[i + txt_char_index] in lexer_info.alphabet ||
					code[i + txt_char_index] in lexer_info.num_chars) &&
					i <= code.len {
					text += code[i + txt_char_index].str()
					txt_char_index++
				} else { break in_text }
			}
			result << Token {
				start: i
				end: i + txt_char_index
				value: text
				token_type: .text
			}
			i += txt_char_index
			continue in_code
		}

		// save number
		mut number := ""
		mut num_char_index := 1
		if code[i] in lexer_info.num_chars {
			number += code[i].str()
			in_number: for {
				if (code[i + num_char_index] in lexer_info.num_chars ||
					code[i + num_char_index] in lexer_info.num_signs) &&
					i <= code.len {
					number += code[i + num_char_index].str()
					num_char_index++
				} else { break in_number}
			}
			result << Token {
				start: i
				end: i + num_char_index
				value: number
				token_type: .number
			}
			i += num_char_index
			continue in_code
		}
	}
	return result
}
