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

    context ".make_move" do 
        it "returns players move" do 
            allow(Player).to receive(:gets) {"0"}
            expect(Player.move).to eql(0)
        end
    end
end