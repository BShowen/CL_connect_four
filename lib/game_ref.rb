module GameRef
    def winner?
        [check_rows,check_columns, check_ascending_row, check_descending_row].find do |method| 
            method == true
        end
    end

    def tie?
        for row in 0..5 do 
            return false if get_row(row).any?(&:is_empty?)
        end
        true
    end

    private 
    def check_rows
        for row in 0..5 do
            row_data = get_row(row).map(&:character).join
            if check_row_or_column(row_data) 
                return true 
            else
                next 
            end
        end
        false
    end

    def check_columns
        for column in 0..6 do
            column_data = get_column(column).map(&:character).join
            if check_row_or_column(column_data) 
                return true 
            else
                next 
            end
        end
        false
    end

    def check_ascending_row
        for row in 0..2 do
            for column in 0..3 do 
                row_data = get_ascending_row([row,column]).map(&:character).join
                if check_row_or_column(row_data) 
                    return true 
                else
                    next 
                end
            end
        end 
        false
    end

    def check_descending_row
        for row in 3..5 do
            for column in 0..3 do 
                row_data = get_descending_row([row,column]).map(&:character).join
                if check_row_or_column(row_data) 
                    return true 
                else
                    next 
                end
            end
        end 
        false
    end

    def check_row_or_column(row_or_col)
        if row_or_col.include?(@player1.character * 4)
            @winners_name = @player1.name
            return true
        elsif row_or_col.include?(@player2.character * 4)
            @winners_name = @player2.name
            return true
        end
        false
    end
end