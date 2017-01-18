class Bowling
    def initialize
        @add_score = []
        @flame_score = []
        @total_score = 0
        @bonus_score = 0
        @flame_times = 2
    end
    def add_score(pins)
        @add_score << pins
        if pins == 10 && @add_score.length % 2 != 0 then
            @add_score << 0
        end
    end
    def total_score
        @total_score
    end
    
    def calc_score
        @add_score.each_slice(@flame_times) do |flame_score|
            @flame_score.push(flame_score)
        end

        @flame_score.length.times do |i|
            if strike_bonus?(i) then
                if @flame_score[i + 1].first == 10 && (i + 1) + 1 < @flame_score.length then
                    @bonus_score += @flame_score[i + 1].inject(:+) + @flame_score[i + 2].first
                else
                    @bonus_score += @flame_score[i + 1].inject(:+)
                end
            elsif spare_bonus?(i) then
                @bonus_score += @flame_score[i + 1].first
            end
           @total_score += @flame_score[i].inject(:+) 
        end
        @total_score += @bonus_score
    end
    
    private
    def strike_bonus?(index)
        @flame_score[index].first == 10 && index + 1 < @flame_score.length
    end
    def spare_bonus?(index)
        @flame_score[index].inject(:+) == 10 && index + 1 < @flame_score.length
    end
    
end
