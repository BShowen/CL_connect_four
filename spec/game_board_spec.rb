require "./lib/game_board.rb"

RSpec.describe GameBoard do
    before(:each) do
        @board = GameBoard.new
    end

    def fill_column_zero
        6.times do
            @board.assign_column(0,"X")
        end
    end

    context "row" do
        it "returns the row specified in the argument" do
            expect(@board.row(0)).to eql([" "," "," "," "," "," "," "])
        end
    end

    context "column" do
        it "returns the colum specified in the argument" do
            expect(@board.column(5)).to eql([" "," "," "," "," "," "])
        end
    end

    context "column_full?" do 
        it "returns false when a column isnt full" do
            expect(@board.column_full?(0)).to eql(false)
        end

        it "returns true for a full column" do
            fill_column_zero

            expect(@board.column_full?(0)).to eql(true)
        end
    end

    context "assign_column" do 
        it "assigns a value to the bottom most square in the column" do
            @board.assign_column(6,"X")
            @board.assign_column(6,"Y")
            expect(@board.row(1)[6]).to eql("Y")
        end

        it "returns nil if column is full" do 
            fill_column_zero

            expect(@board.assign_column(0,"x")).to eql(nil)
        end
    end

end