module GameRef
    def winner?
        @winner = nil
        @winner = check_rows 
        @winner = check_columns if winner == false
        @winner = check_diagonally_ascending if winner == false
        @winner = check_diagonally_descending if winner == false
        @winner
    end

    def winners_name
        @players[0].character == @winner ? @players[0].name : @players[1].name
    end

    private 
    def check_rows
        for row in 0..5
            row = get_row(row).map(&:character).join
            player1_character = @players[0].character
            player2_character = @players[1].character
    
            return player1_character if row.include?(player1_character * 4)
            return player2_character if row.include?(player2_character * 4)
        end
        false
    end

    def check_columns
        for column in 0..6
            column = get_column(column).map(&:character).join
            player1_character = @players[0].character
            player2_character = @players[1].character
    
            return player1_character if column.include?(player1_character * 4)
            return player2_character if column.include?(player2_character * 4)
        end
        false
    end

    def check_diagonally_ascending
        for row in 0..2 do
            for column in 0..3 do 
                row_data = get_ascending_diagonal_row([row,column]).map(&:character).join
                player1_character = @players[0].character
                player2_character = @players[1].character

                return player1_character if row_data.include?(player1_character * 4)
                return player2_character if row_data.include?(player2_character * 4)
            end
        end 
        false
    end

    def check_diagonally_descending
        for row in 3..5 do
            for column in 0..3 do 
                row_data = get_descending_diagonal_row([row,column]).map(&:character).join
                player1_character = @players[0].character
                player2_character = @players[1].character

                return player1_character if row_data.include?(player1_character * 4)
                return player2_character if row_data.include?(player2_character * 4)
            end
        end 
        false
    end
end