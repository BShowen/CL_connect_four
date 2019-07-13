class Player
    attr_reader :name, :character

    def initialize(name,character)
        @name = name
        @character = character
    end

    def make_a_move
        move = gets.chomp
    end
end