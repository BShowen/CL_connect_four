require "./lib/game_board.rb"

RSpec.describe "GameBoard module" do
    let(:game) {GameBoard.new}
    
    def create_winner_scenario
        4.times do
            game.drop_piece(0,"X")
        end
    end
end