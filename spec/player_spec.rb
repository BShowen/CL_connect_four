require "./lib/player.rb"

RSpec.describe Player do
    let(:player) {Player.new("John Smith","X")}

    context "#name" do
        it "returns players name" do
            expect(player.name).to eql("John Smith")
        end
    end

    context "#character" do
        it "returns players character" do
            expect(player.character).to eql("X")
        end
    end

    context "#make_a_move" do 
        it "returns players move" do 
            allow(player).to receive(:gets) {"X"}
            expect(player.make_a_move).to eql("X")
        end
    end
end