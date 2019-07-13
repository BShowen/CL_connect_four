require_relative "./square.rb"

class GameBoard

    attr_accessor :cloned_board

    def initialize
        @game_board = Array.new(6) { Array.new(7) }
        initialize_each_sqaure
        @cloned_board = nil
    end

    def display
        deep_clone_object_board
        convert_cloned_board_into_string_board
        add_borders_to_board_columns
        @cloned_board.join
    end

    def get_row(row)
        row = (5 - row) # read grid from the bottom to the top.
        @game_board[row]
    end

    def get_column(column)
        col = []
        for index in 0..5 do 
           col << self.get_row(index)[column]
        end
        col
    end

    def drop_piece(specified_column, new_character)
        return false if column_full?(specified_column)
        
        for index in 0..6 do
            if get_row(index)[specified_column].game_piece == " "
                get_row(index)[specified_column].game_piece = new_character
                return true
                break   
            end
        end
    end
    

    private 

    def initialize_each_sqaure
        @game_board.map! do |row|
            row.map! { Square.new }
        end
    end

    def convert_cloned_board_into_string_board
        @cloned_board.each do |row|
            row.map!(&:game_piece)
        end
    end

    def add_borders_to_board_columns
        @cloned_board.map! do |row|
            "| " + row.join(" | ") + " |\n"
        end

        bottom_row = ["|---|---|---|---|---|---|---|"]
        @cloned_board << bottom_row
    end

    def deep_clone_object_board
        @cloned_board = Marshal.load(Marshal.dump(@game_board))
    end

    def column_full?(column)
        self.get_column(column).all? do |square|
            square.game_piece != " "
        end
    end
end