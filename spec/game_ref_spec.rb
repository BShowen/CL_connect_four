require "./lib/game_board.rb"
require "./lib/player.rb"

RSpec.describe "GameBoard module" do
    let(:game) {GameBoard.new}
    before(:each) do 
        player1 = Player.new("Adam","X")
        player2 = Player.new("John","O")
        @game_board = GameBoard.new(player1, player2)
    end
    
    def create_winner_in_this_row(row)
        for column in 2..5
            @game_board.get_row(row)[column].character = "X"
        end
    end

    def create_winner_in_this_column(column)
        4.times do
            @game_board.drop_piece(column,"X")
        end
    end

    context "#winner?" do
        it "returns the character of the winner in a random row" do 
            create_winner_in_this_row(rand(0..5))
            puts @game_board.display
            expect(@game_board.winner?).to eql("X")
        end

        it "returns the character of the winner in a random column" do 
            create_winner_in_this_column(rand(0..6))
            puts @game_board.display
            expect(@game_board.winner?).to eql("X")
        end

        it "returns false when there is no winner: the board is blank" do
            expect(@game_board.winner?).to eql(false)
        end
    end


    context "#winners_name" do
        xit "returns the name of the winner" do 
            expect(@game_board.winners_name).to eql("John")
        end
    end

end