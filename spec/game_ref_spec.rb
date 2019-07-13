require "./lib/game_board.rb"

RSpec.describe "GameBoard module" do
    let(:game) {GameBoard.new}
    before(:each) do 
        player1 = double("player_one", :name => "John Doe", :character => "X")
        player2 = double("player_two", :name => "Adam Smith", :character => "O")
        @game_board = GameBoard.new(player1, player2)
    end
    
    def create_winner_scenario
        for i in 0..3 do
            @game_board.drop_piece(i,"X")
        end
    end

    def make_player
        player1 = double('player1')
        allow(player1).to receive(:name){"John Smith"}
        allow(player1).to receive(:character){"X"}
    end

    context "#winner?" do
        it "returns true if there is a winner" do 
            create_winner_scenario
            expect(@game_board.winner?).to eql(true)
        end

        it "returns false when there is no winner" do
            expect(@game_board.winner?).to eql(false)
        end

        it "handles an edge case where there is a winner" do #you just tested this 12:10pm. 
            @game_board.drop_piece(3,"X")
            @game_board.drop_piece(4,"X")
            @game_board.drop_piece(5,"X")
            @game_board.drop_piece(6,"X")
            
            expect(@game_board.winner?).to eql(true)
        end

        xit "returns true for a winner with an edge case" do
            @game_board.drop_piece(0,"X")
            @game_board.drop_piece(2,"X")
            @game_board.drop_piece(4,"X")
            @game_board.drop_piece(6,"X")
            @game_board.drop_piece(1,"O")
            @game_board.drop_piece(3,"O")
            @game_board.drop_piece(5,"O")
            @game_board.drop_piece(3,"X")
            @game_board.drop_piece(4,"X")
            @game_board.drop_piece(5,"X")
            @game_board.drop_piece(6,"X")

            expect(@game_board.winner?).to eql(true)
        end
    end

    context "#winners_name" do
        xit "returns the name of the winner" do 
            make_player

            expect(@game_board.winners_name).to eql("John Smith")
        end
    end

end