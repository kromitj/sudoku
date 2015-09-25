require("./sudoku-class.rb")

game = Sudoku.new([["*",3,2,8,"*","*","*",4,"*"],[8,9,"*",4,2,"*",6,"*","*"],[4,5,"*",7,6,9,"*","*","*"],["*","*",8,2,"*",1,5,"*",3],["*","*",5,7,"*",6,"*",4,"*"],["*","*","*",5,"*",4,8,2,7],[9,"*","*",3,"*","*","*",2,"*"],["*",7,"*","*",1,"*","*","*",8],["*",1,"*","*","*",2,3,"*","*"]])
# game = Sudoku.new([[5,3,9,7,4,1,2,8,6],[1,6,7,8,2,5,4,9,3],[4,8,2,3,6,9,7,1,5],[8,2,5,1,6,7,4,9,3],[6,7,1,9,3,4,2,5,8],[9,4,3,5,2,8,1,7,6],[6,7,2,3,5,8,9,1,4],[3,4,9,7,1,6,5,8,2],[8,5,'*',2,9,4,6,3,7]])
while true
	game.show_title
	game.display_board
	game.get_next_move
	game.set_move
	if game.game_complete? == true
		puts "Congrates you won!!!"
		puts "Play Again? y/n"
		play_again = gets.chomp
		if play_again == 'y'
			game = Sudoku.new([["*",3,2,8,"*","*","*",4,"*"],[8,9,"*",4,2,"*",6,"*","*"],[4,5,"*",7,6,9,"*","*","*"],["*","*",8,2,"*",1,5,"*",3],["*","*",5,7,"*",6,"*",4,"*"],["*","*","*",5,"*",4,8,2,7],[9,"*","*",3,"*","*","*",2,"*"],["*",7,"*","*",1,"*","*","*",8],["*",1,"*","*","*",2,3,"*","*"]])
		else puts "Thanks for playing good-bye"
		end
	end
end