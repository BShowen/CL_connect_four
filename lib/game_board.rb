# require_relative "./square.rb"

class GameBoard

    def initialize
        @board = Array.new(6) do
            Array.new(7," ")
        end
    end

    def display
        @board.each do |row|
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
            if row(index)[specified_column] == " "
                row(index)[specified_column] = character
                break   
            end
        end
    end

    def column_full?(column)
        column(column).all? do |square|
            square != " "
        end
    end

end