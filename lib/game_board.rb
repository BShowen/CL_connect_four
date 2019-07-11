class GameBoard
    def display
        "|   |   |   |   |   |   |   |\n|---|---|---|---|---|---|---|\n|   |   |   |   |   |   |   |\n|---|---|---|---|---|---|---|\n|   |   |   |   |   |   |   |\n|---|---|---|---|---|---|---|\n|   |   |   |   |   |   |   |\n|---|---|---|---|---|---|---|\n|   |   |   |   |   |   |   |\n|---|---|---|---|---|---|---|\n|   |   |   |   |   |   |   |\n|---|---|---|---|---|---|---|".center(100)
    end

    def initialize
        @board = [[nil,nil,nil,nil,nil,nil],
                            [nil,nil,nil,nil,nil,nil],
                            [nil,nil,nil,nil,nil,nil],
                            [nil,nil,nil,nil,nil,nil],
                            [nil,nil,nil,nil,nil,nil],
                            [nil,nil,nil,nil,nil,nil]]
    end

    def row(row)
        @board[5 - row]
    end

    def row_column(column)
        col = []
        for index in 0..5 do 
           col << self.row(index)[column]
        end
        col
    end

end