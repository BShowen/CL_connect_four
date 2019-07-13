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

    context "#get_row" do
        it "returns the row specified in the argument" do
            expect(@board.get_row(0).map(&:character)).to eql([" "," "," "," "," "," "," "])
        end

        it "returns the specified row with pieces dropped in" do
            @board.drop_piece(0,"X")
            expect(@board.get_row(0).map(&:character)).to eql(["X"," "," "," "," "," "," "])
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
            expect(@board.display).to eql("|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|---|---|---|---|---|---|---|")
        end
    end

end