require "./lib/game_board.rb"

RSpec.describe GameBoard do
    
    before(:each) do
        player1 = double("player_one", :name => "John Doe", :character => "X")
        player2 = double("player_two", :name => "Adam Smith", :character => "O")
        @board = GameBoard.new(player1, player2)
    end

    def fill_column(specified_column)
        6.times do
            @board.drop_piece(specified_column,"X")
        end
    end

    def create_ascending_diagonal_row
        @board.get_row(0)[0].character = "X"
        @board.get_row(1)[1].character = "X"
        @board.get_row(2)[2].character = "O"
        @board.get_row(3)[3].character = "X"
        @board.get_row(4)[4].character = "X"
        @board.get_row(5)[5].character = "X"
    end

    def create_descending_diagonal_row
        @board.get_row(0)[6].character = "X"
        @board.get_row(1)[5].character = "X"
        @board.get_row(2)[4].character = "O"
        @board.get_row(3)[3].character = "X"
        @board.get_row(4)[2].character = "X"
        @board.get_row(5)[1].character = "X"
    end

    context "#get_row" do
        it "returns the row specified in the argument" do
            expect(@board.get_row(0).map(&:character)).to eql([" "," "," "," "," "," "," "])
        end

        it "returns the specified row with pieces dropped in" do
            @board.drop_piece(3,"X")
            expect(@board.get_row(0).map(&:character)).to eql([" "," "," ","X"," "," "," "])
        end
    end

    context "#get_column" do
        it "returns the colum specified in the argument" do
            expect(@board.get_column(5).map(&:character)).to eql([" "," "," "," "," "," "])
        end

        it "returns the specified column with pieces dropped in" do
            @board.drop_piece(3,"X")
            @board.drop_piece(3,"O")

            expect(@board.get_column(3).map(&:character)).to eql(["X","O"," "," "," "," "])
        end
    end

    context "#get_ascending_row" do 

        it "returns the row, starting from the coordinates of any square" do
            create_ascending_diagonal_row
            expect(@board.get_ascending_row([0,0]).map(&:character)).to eql(["X","X","O","X","X","X"])
        end

        it "same test as above with different starting position" do 
            expect(@board.get_ascending_row([0,1]).map(&:character)).to eql([" "," "," "," "," "," ",])
        end 

        it "returns a partially populated row" do 
            @board.get_row(1)[1].character = "O"
            @board.get_row(3)[3].character = "X"
            @board.get_row(5)[5].character = "O"
            expect(@board.get_ascending_row([0,0]).map(&:character)).to eql([" ","O"," ","X"," ","O",])
        end

        it "handles an edge case where the initial square is near a corner" do 
            @board.get_row(4)[0].character = "X"
            @board.get_row(5)[1].character = "O"

            expect(@board.get_ascending_row([4,0]).map(&:character)).to eql(["X","O"])
        end

        it "handles an edge case where the initial square is near another corner" do 
            @board.get_row(0)[5].character = "X"
            @board.get_row(1)[6].character = "O"

            expect(@board.get_ascending_row([0,5]).map(&:character)).to eql(["X","O"])
        end

        it "handles an edge case where the starting square is in the middle of the board" do 
            @board.get_row(3)[3].character = "X"
            @board.get_row(4)[4].character = "O"
            @board.get_row(5)[5].character = "X"

            expect(@board.get_ascending_row([3,3]).map(&:character)).to eql(["X","O","X"])
        end
    end

    context "#get_descending_row" do 
    it "returns the row, starting from the coordinates of any square" do
        create_descending_diagonal_row
        
        expect(@board.get_descending_row([5,1]).map(&:character)).to eql(["X","X","X","O","X","X"])
    end

    it "same test as above with different starting position" do
         
        expect(@board.get_descending_row([5,0]).map(&:character)).to eql([" "," "," "," "," "," ",])
    end 

    it "returns a partially populated row" do 
        @board.get_row(1)[5].character = "O"
        @board.get_row(3)[3].character = "X"
        @board.get_row(5)[1].character = "O"
        
        expect(@board.get_descending_row([5,1]).map(&:character)).to eql(["O"," ","X"," ","O"," ",])
    end

    it "handles an edge case where the initial square is near a corner" do 
        @board.get_row(4)[6].character = "X"
        @board.get_row(5)[5].character = "O"
        
        expect(@board.get_descending_row([5,5]).map(&:character)).to eql(["O","X"])
    end

    it "handles an edge case where the initial square is near another corner" do 
        @board.get_row(0)[1].character = "X"
        @board.get_row(1)[0].character = "O"
        
        expect(@board.get_descending_row([1,0]).map(&:character)).to eql(["O","X"])
    end

    it "handles an edge case where the starting square is in the middle of the board" do 
        @board.get_row(3)[3].character = "X"
        @board.get_row(2)[4].character = "O"
        @board.get_row(1)[5].character = "X"
        
        expect(@board.get_descending_row([3,3]).map(&:character)).to eql(["X","O","X"," "])
    end
    end
 
    context "#drop_piece" do 
        it "assigns a value to the bottom most square in the column" do
            @board.drop_piece(6,"X")
            @board.drop_piece(6,"Y")
            expect(@board.get_row(1)[6].character).to eql("Y")
        end

        it "returns false if column is full" do 
            fill_column(0)

            expect(@board.drop_piece(0,"x")).to eql(false)
        end
    end

    context "#display" do
        it "returns the game board as a string" do
            expect(@board.display).to eql("|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|---|---|---|---|---|---|---|\n| 0 | 1 | 2 | 3 | 4 | 5 | 6 |")
        end
    end

end