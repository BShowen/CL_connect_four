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
        it "returns true for a winner in a random row" do 
            create_winner_in_this_row(rand(0..5))
            expect(@game_board.winner?).to eql(true)
        end

        it "return true for a winner in a random column" do 
            create_winner_in_this_column(rand(0..6))
            expect(@game_board.winner?).to eql(true)
        end

        it "returns true for the winner in an ascending diagonal row" do 
            @game_board.get_row(0)[2].character = "X"
            @game_board.get_row(1)[3].character = "X"
            @game_board.get_row(2)[4].character = "X"
            @game_board.get_row(3)[5].character = "X"
            expect(@game_board.winner?).to eql(true)
        end

        it "returns true for the winner in a descending diagonal row" do 
            @game_board.get_row(5)[0].character = "O"
            @game_board.get_row(4)[1].character = "O"
            @game_board.get_row(3)[2].character = "O"
            @game_board.get_row(2)[3].character = "O"

            expect(@game_board.winner?).to eql(true)
        end

        it "returns nil when there is no winner: the board is blank" do
            expect(@game_board.winner?).to eql(nil)
        end
    end


    context "#winners_name" do
        it "returns the name of the winner" do 
            4.times {@game_board.drop_piece(0,"O")}
            @game_board.winner?
            expect(@game_board.winners_name).to eql("John")
        end

        it "returns the name of a different winner" do 
            4.times {@game_board.drop_piece(0,"X")}
            @game_board.winner?
            expect(@game_board.winners_name).to eql("Adam")
        end
    end

end