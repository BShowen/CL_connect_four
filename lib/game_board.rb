require_relative "./square.rb"

class GameBoard

    def initialize
        @board = Array.new(6) { Array.new(7) }
        initialize_each_sqaure
    end

    def initialize_each_sqaure
        @board.map! do |row|
            row.map! do 
                Square.new
            end
        end
    end

    def display
        display_board = []
        for row in 0...(@board.length) do
            display_board << []
            for square in 0...(@board[row].length) do
                display_board[row] << @board[row][square].game_piece
            end
        end

        display_board.each do |row|
            puts "| " + row.join(" | ") + " |"
        end
        puts "|---|---|---|---|---|---|---|"
    end

    def row(row)
        @board[5 - row]
    end

    def column(column)
        col = []
        for index in 0..5 do 
           col << self.row(index)[column]
        end
        col
    end

    def assign_column(specified_column, character)
        return nil if column_full?(specified_column)
        
        for index in 0..6 do
            if row(index)[specified_column].game_piece == " "
                row(index)[specified_column].game_piece = character
                return true
                break   
            end
        end
    end

    def column_full?(column)
        column(column).all? do |square|
            square.game_piece != " "
        end
    end

end