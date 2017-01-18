class Bowling
    def initialize
        @add_score = 0
        @total_score = 0
    end
    def add_score(pins)
        @add_score = pins
        @total_score += @add_score
    end
    def total_score
        @total_score
    end
end
