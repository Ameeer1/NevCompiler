module main

fn main() {
	println(tokenize("
open ./map_game.nev
open console as cmd

fun main {
    val hello_map = Map((10,10), (1,1), (9,9)).world_blocks([
        [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall],
        [.wall, .air , .air , .air , .wall, .wall, .wall, .wall, .wall, .wall],
        [.wall, .air , .wall, .air , .wall, .wall, .wall, .wall, .wall, .wall],
        [.wall, .air , .wall, .air , .air , .air , .air , .air , .wall, .wall],
        [.wall, .air , .wall, .wall, .wall, .air , .wall, .wall, .air , .wall],
        [.wall, .wall, .wall, .wall, .wall, .air , .air , .wall, .wall, .wall],
        [.wall, .wall, .wall, .wall, .air , .air , .air , .hole, .wall, .wall],
        [.wall, .wall, .wall, .wall, .wall, .air , .wall, .air , .air , .wall],
        [.wall, .wall, .wall, .wall, .wall, .air , .air , .air , .air , .wall],
        [.wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall, .wall]
    ])

    var youssef: Player = .active(hello_map).abilities([.skip_walls])

    while !youssef.is_won ->
        try youssef.play_once() or {
            cmd.print(\"youssef is a loser :|\")
            break
        }
    else {
        youssef == .idle
        cmd.print(\"youssef has won the game!!!\")
    }
}
		"))
}
