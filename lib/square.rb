class Square

    attr_accessor :character

    def initialize
        @character = " "
    end

    def is_unassigned?
        @character == " "
    end

end 