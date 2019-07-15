module GameRef
    def winner?
        winner = nil
        winner = check_rows 
        winner = check_columns if winner == false
        # check_diagonally_for_winner
        winner
    end

    def winners_name

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


end