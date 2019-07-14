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
        counter = 1
        for row in 0..5
            reference_square = get_square(row,0)
            for column in 1..6

                current_square = get_square(row,column)
                if current_square.character == reference_square.character
                    counter +=1
                    return reference_square.character if (counter == 4 && (reference_square.is_unassigned? == false))
                elsif current_square.character != reference_square.character
                    reference_square = current_square
                    counter = 1
                end
                
            end
        end
        false
    end


end