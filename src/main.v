module main

fn main() {
	println(tokenize("
use nev:io

main :: {
    data := [5, 2, 9, 1, 4]
    result := data
        |> filter x => x % 2 == 0
        |> map x => x * 2

    io.write(result: line)
}
		"))
}
