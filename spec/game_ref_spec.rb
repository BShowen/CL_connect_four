require "./lib/game_board.rb"
require "./lib/player.rb"

RSpec.describe "GameBoard module" do
    let(:game) {GameBoard.new}
    before(:each) do 
        player1 = Player.new("Adam","X")
        player2 = Player.new("John","O")
        @game_board = GameBoard.new(player1, player2)
    end
    
    def create_winner_scenario
        for i in 0..3 do
            @game_board.drop_piece(i,"X")
        end
    end

    def create_a_top_row_winner
        for i in 0..4 do   
            for x in 0..6 do
                @game_board.drop_piece(x,x.to_s)
            end
        end
        for i in 3..6
            @game_board.drop_piece(i,"X")
        end
    end

    def make_player
        player1 = double('player1')
        allow(player1).to receive(:name){"John Smith"}
        allow(player1).to receive(:character){"X"}
    end

    context "#winner?" do
        it "returns the character of the winner" do 
            create_winner_scenario
            expect(@game_board.winner?).to eql("X")
        end

        it "returns false when there is no winner: the board is blank" do
            expect(@game_board.winner?).to eql(false)
        end

        it "finds a winner at the end of a row" do 
            @game_board.drop_piece(3,"X")
            @game_board.drop_piece(4,"X")
            @game_board.drop_piece(5,"X")
            @game_board.drop_piece(6,"X")
            
            expect(@game_board.winner?).to eql("X")
        end

        it "finds a winner in a different row" do
            @game_board.drop_piece(0,"X")
            @game_board.drop_piece(2,"X")
            @game_board.drop_piece(4,"X")
            @game_board.drop_piece(6,"X")
            @game_board.drop_piece(1,"O")
            @game_board.drop_piece(3,"O")
            @game_board.drop_piece(5,"O")
            @game_board.drop_piece(2,"Q")
            @game_board.drop_piece(3,"Q")
            @game_board.drop_piece(4,"Q")
            @game_board.drop_piece(5,"Q")

            expect(@game_board.winner?).to eql("Q")
        end
        
        it "finds a winner in the rop row" do    
            create_a_top_row_winner

            expect(@game_board.winner?).to eql("X")
        end
    end

    context "#winners_name" do
        xit "returns the name of the winner" do 
            make_player

            expect(@game_board.winners_name).to eql("John")
        end
    end

end