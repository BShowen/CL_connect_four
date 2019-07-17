module GameRef
    def winner?
        @winner = check_rows 
        @winner = check_columns if winner == false
        @winner = check_diagonally_ascending if winner == false
        @winner = check_diagonally_descending if winner == false
        @winner
    end

    def winners_name
        @player1.character == @winner ? @player1.name : @player2.name
    end

    private 
    def check_rows
        for row in 0..5
            row = get_row(row).map(&:character).join
            result = check_row_or_column(row)
            return result if result != nil
        end
        false
    end

    def check_columns
        for column in 0..6
            column = get_column(column).map(&:character).join
            result = check_row_or_column(column)
            return result if result != nil
        end
        false
    end

    def check_diagonally_ascending
        for row in 0..2 do
            for column in 0..3 do 
                row_data = get_ascending_diagonal_row([row,column]).map(&:character).join
                result = check_row_or_column(row_data)
                return result if result != nil
            end
        end 
        false
    end

    def check_diagonally_descending
        for row in 3..5 do
            for column in 0..3 do 
                row_data = get_descending_diagonal_row([row,column]).map(&:character).join
                result = check_row_or_column(row_data)
                return result if result != nil
            end
        end 
        false
    end

    def check_row_or_column(row_or_col)
        return @player1.character if row_or_col.include?(@player1.character * 4)
        return @player2.character if row_or_col.include?(@player2.character * 4)
    end
end

