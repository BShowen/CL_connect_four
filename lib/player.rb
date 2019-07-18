class Player
    attr_reader :name, :character

    def initialize(name,character)
        @name = name
        @character = character
    end

    def Player.move
        begin
            reply = Integer(gets.chomp) rescue raise
            raise if reply < 0 || reply > 6
        rescue
            puts "Invalid entry. Try again."
            retry
        else
            reply
        end
    end
end