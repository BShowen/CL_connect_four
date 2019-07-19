require_relative "./square.rb"
require_relative "./game_ref"

class GameBoard
    include GameRef

    attr_accessor :cloned_board, :winners_name

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @game_board = Array.new(6) { Array.new(7) } #array of 6 arrays. each array containing 7 elements. 
        initialize_each_board_square
        @cloned_board = nil
        @winners_name = nil
    end

    def display
        deep_clone_game_board
        convert_cloned_board_into_string_board
        add_borders_to_board_columns
        @cloned_board.join
    end

    def get_row(row)
        return nil if (row > 5 || row < 0)
        row = (5 - row) # read grid from the bottom to the top.
        @game_board[row]
    end

    def get_column(column)
        col = []
        for row in 0..5 do 
           col << @game_board[5 - row][column]
        end
        col
    end

    def drop_piece(column, player_character)
        return false if column_full?(column)
        
        for row in 0..5 do
            if get_square(row, column).is_empty?
                get_square(row, column).character = player_character
                return true
                break   
            end
        end
    end

    def get_ascending_row(coordinates)
        row = coordinates[0]
        column = coordinates[1]
        starting_square = get_square(row,column) 
        diagonal_row = Array.new(1,starting_square)
        loop do
            row += 1
            column += 1
            return diagonal_row if row > 5 or column > 6
            diagonal_row << get_square(row, column) 
        end
    end

    def get_descending_row(coordinates)
        row = coordinates[0]
        column = coordinates[1]
        starting_square = get_square(row,column) 
        diagonal_row = Array.new(1,starting_square)
        loop do
            row -= 1
            column += 1
            return diagonal_row if row < 0 or column > 6
            diagonal_row << get_square(row, column) 
        end
    end 

    private
    def get_square(row,column)
        get_row(row)[column]
    end

    def initialize_each_board_square
        @game_board.map! do |row|
            row.map! { Square.new }
        end
    end

    def convert_cloned_board_into_string_board
        @cloned_board.each do |row|
            row.map!(&:character)
        end
    end

    def add_borders_to_board_columns
        @cloned_board.map! do |row|
            "| #{row.join(" | ")} |\n"
        end
        bottom_row = ["|---|---|---|---|---|---|---|\n| 0 | 1 | 2 | 3 | 4 | 5 | 6 |"]
        @cloned_board << bottom_row
    end

    def deep_clone_game_board
        @cloned_board = Marshal.load(Marshal.dump(@game_board))
    end

    def column_full?(column)
        self.get_column(column).all? do |square|
            square.character != " "
        end
    end
end