module GameRef
    def winner?
        check_rows_for_winner
        # check_columns_for_winner
        # check_diagonally_for_winner
    end

    def winners_name

    end

    private 
    def check_rows_for_winner
        counter = 0
        starting_square = get_square(0,0)
        for row in 0..5
            for column in 0..6


                next if starting_square.is_unassigned? #you are here. 12:10PM. This line of code prevents the remainig line of code to be executed once starting_square is assigned to an empty square. starting_square needs to be assigned some wat after its been processed as an empty square.

                current_square = get_square(row, column) 
                if current_square.character == starting_square.character
                    counter += 1
                    return true if counter == 4
                else
                    starting_square = get_square(row, column)
                    counter = 0
                end


            end
        end
        false
    end


end