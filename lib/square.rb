class Square

    attr_accessor :character, :neighbor

    def initialize
        @character = " "
        @neighbor = {  :top => nil,
                                    :bottom => nil, 
                                    :left => nil,
                                    :right => nil,
                                    :top_left => nil,
                                    :top_right => nil,
                                    :bottom_left => nil,
                                    :bottom_right => nil
                                }
    end

    def is_unassigned?
        @character == " "
    end
end 