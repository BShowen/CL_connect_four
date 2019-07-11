require "./lib/game_board.rb"

RSpec.describe GameBoard do
    before(:each) do
        @board = GameBoard.new
    end

    context "board rows" do
        it "returns the row specified in the argument" do
            expect(@board.row(0)).to eql([nil,nil,nil,nil,nil,nil])
        end
    end

    context "board columns" do
        it "returns the colum specified in the argument" do
            expect(@board.row_column(5)).to eql([nil,nil,nil,nil,nil,nil])
        end
    end

end