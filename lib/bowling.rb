class Bowling
    def initialize
        @add_score = []
        @total_score = 0
        @bonus_score = 0
        @flame_times = 2
    end
    def add_score(pins)
        @add_score << pins
    end
    def total_score
        @total_score
    end
    def calc_score
        @add_score.length.times do |i|
           if (i + 1) % @flame_times == 0 then
               if @add_score[i - 1] + @add_score[i] == 10 && i + 1 < @add_score.length then
                   @bonus_score += @add_score[i + 1]
               end
           end
           @total_score += @add_score[i] 
        end
        @total_score += @bonus_score
    end
end
