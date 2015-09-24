board = [["*",3,2,8,"*","*","*",4,"*"],[8,9,"*",4,2,"*",6,"*","*"],[4,5,"*",7,6,9,"*","*","*"],["*","*",8,2,"*",1,5,"*",3],["*","*",5,7,"*",6,"*",4,"*"],["*","*","*",5,"*",4,8,2,7],[9,"*","*",3,"*","*","*",2,"*"],["*",7,"*","*",1,"*","*","*",8],["*",1,"*","*","*",2,3,"*","*"]]
game_won = false
def check_horizontal(board)
	root_rows = [0, 3, 6]
	root_rows.each do |root_row|
		sub_rows = [0, 3, 6]
		sub_rows.each do |sub_row|
			current_row = board[root_row][sub_row..sub_row + 2] + 
					      board[root_row + 1][sub_row..sub_row + 2] + 
			              board[root_row + 2][sub_row..sub_row + 2]
			p current_row
			return false unless all_nums?(current_row)
			
		end # /sub_rows
	end # /root_rows
	return true
end # /def

def all_nums?(array)
	Array(1..9) == array.sort
end

# def display_board(board)
# 	rows = []
# 	root_rows = [0, 3, 6]
# 	root_rows.each do |root_row|
# 		sub_rows = [0, 3, 6]
# 		sub_rows.each do |sub_row|
# 			current_row = board[root_row][sub_row..sub_row + 2] + 
# 					      board[root_row + 1][sub_row..sub_row + 2] + 
# 			              board[root_row + 2][sub_row..sub_row + 2]	
# 			rows << current_row	
# 		end # /sub_rows
# 	end
# 	return rows.to_s
# end

def get_rows(board)
	rows = []
	root_rows = [0, 3, 6]
	root_rows.each do |root_row|
		sub_rows = [0, 3, 6]
		sub_rows.each do |sub_row|
			current_row = board[root_row][sub_row..sub_row + 2] + 
					      board[root_row + 1][sub_row..sub_row + 2] + 
			              board[root_row + 2][sub_row..sub_row + 2]	
			rows << current_row	
		end # /sub_rows
	end
	return rows
end

def get_columns(board)
	columns = []
	root_columns = [0,1,2]
	root_columns.each do |root_column|
		sub_culumns = [0,1,2]
		sub_culumns.each do |column|
			current_column = board[root_column][column] + board[root_column][column + 3] + board[root_column][column + 6] +
						      board[root_column + 3][column] + board[root_column + 3][column + 3] + board[root_column + 3][column + 6] +
				              board[root_column + 6][column] + board[root_column + 6][column + 3] + board[root_column + 6][column + 6]	
			columns << current_column
		end 
	end
	return columns.to_s
end

def display_board(rows)
	formated = add_row_seps(add_column_seps(get_rows(rows)))
	formated.each { |row| puts row.join(" ")}
end

def add_column_seps(rows)
	with_column_seps = rows
	with_column_seps.each do |row|
		row.insert(3, "|")
		row.insert(7, "|")
	end
	return with_column_seps
end

def add_row_seps(rows)
	row_sep = ['-','-','-','+','-','-','-','+','-','-','-']
	with_row_seps = rows
		with_row_seps.insert(3, row_sep)
		with_row_seps.insert(7, row_sep)
	return with_row_seps	
end

def get_next_move
	puts "Enter Next Move:(Grid, Index, Number)"
	user_input = gets.chomp.split(",")
end
def move_valid?(move, board)
	value_at_move = board[move[0].to_i][move[2].to_i]	
	return true if board[move[0].to_i][move[1].to_i] == "*"
	return false
end
def set_move(move, board)
	board = board
	if move_valid?(move, board) == true
		board[move[0].to_i][move[1].to_i] = move[2].to_i 
	end
	return board
end

while game_won == false
	puts "
  __                              
 (_           _|         |        
 __)   |_|   (_|   |_|   |<   |_|
	"
	display_board(board)
	puts ""
	user_input = get_next_move
	set_move(user_input, board)
end
# puts get_columns(board)

# puts display_board(board)
# puts display_board(board)
# puts (check_horizontal(board))