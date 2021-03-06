require 'colorize'

class Sudoku
	attr_reader = :board, :num_locations, :game_won, :turn
	@board = []
	@num_locations = []
	@game_won = false
	@turn = 0
	@user_input = nil

	def num_locations
		@num_locations
	end

	def game_won
		return @game_won
	end

	def initialize(board)
		@board = board
		self.create_num_locations
	end

	def create_num_locations
		set_pieces = []
		@board.each_with_index do |grid, i|
			grid.each_with_index do |el, j|
				set_pieces << [i, j] if @board[i][j] != '*'
			end
		end
		@num_locations = set_pieces
	end

	def get_rows
		rows = []
		root_rows = [0, 3, 6]
		root_rows.each do |root_row|
			sub_rows = [0, 3, 6]
			sub_rows.each do |sub_row|
				current_row = @board[root_row][sub_row..sub_row + 2] + 
						      @board[root_row + 1][sub_row..sub_row + 2] + 
				              @board[root_row + 2][sub_row..sub_row + 2]	
				rows << current_row	
			end # /sub_rows
		end
		return rows
	end

	def get_columns
		columns = []
		root_columns = [0,1,2]
		root_columns.each do |root_column|
			sub_culumns = [0,1,2]
			sub_culumns.each do |column|
				current_column =  @board[root_column][column].to_s + @board[root_column][column + 3].to_s + @board[root_column][column + 6].to_s +
							      @board[root_column + 3][column].to_s + @board[root_column + 3][column + 3].to_s + @board[root_column + 3][column + 6].to_s +
					              @board[root_column + 6][column].to_s + @board[root_column + 6][column + 3].to_s + @board[root_column + 6][column + 6].to_s
				current_column = current_column.split("").map { |n| n != '*' ? n.to_i : n}	
				columns << current_column
			end 
		end
		return columns
	end

	def display_board
		@num_locations.each do |i|
			@board[i[0]][i[1]] = @board[i[0]][i[1]] 
		end	
		formated = add_row_seps(add_column_seps(get_rows))
		formated.each { |row| puts "               " + row.join(" ")}
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
		puts "Enter Next Move:(Grid, Index, Number ex: 0,0,1 or 0, 0, 1)"
		@user_input = gets.chomp.split(",")
	end

	def move_valid?
		return false if @user_input[0].to_i.between?(0, 8) == false
		return false if @user_input[1].to_i.between?(0, 8) == false
		return false if @user_input[2].to_i.between?(0, 8) == false
		return false if @num_locations.include?([@user_input[0].to_i, @user_input[1].to_i])
		# value_at_move = @board[@user_input[0].to_i][@user_input[1].to_i]	
		# return true if @board[@user_input[0].to_i][@user_input[1].to_i] == "*"
		# return false
		return true
	end

	def set_move
		if move_valid? == true
			@board[@user_input[0].to_i][@user_input[1].to_i] = @user_input[2].to_i 
		end
	end

	def all_nums?(arr)
		return false if arr.include?("*")
		arr_sort = arr.sort
		return true if arr_sort == Array(1..9)
	end

	def check_rows(rows)
		rows.each { |row| return false if all_nums?(row) == false}
		return true
	end

	def check_columns(columns)
		columns.each { |column| return false if all_nums?(column) == false}
		return true
	end

	def check_grids(grids)
		grids.each { |grid| return false if all_nums?(grid) == false}
		return true
	end

	def game_complete?
		rows = get_rows
		columns = get_columns
		grids = @board
		return true if (check_grids(grids)) && (check_columns(columns)) && (check_grids(grids))
		return false		
	end

	def show_title
			puts "
	
	  __                              
	 (_           _|         |        
	 __)   |_|   (_|   |_|   |<   |_|
	 <^>^<^>^<^>^<^>^<^>^<^>^<^>^<^>^
		".colorize(:cyan)
	end

end

