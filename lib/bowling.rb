class Bowling
    def initialize
        @add_score = []
        @frame_score = []
        @total_score = 0
        @frame_total_score = []
        @bonus_score = 0
        @frame_times = 2
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
        @add_score.each_slice(@frame_times) do |frame_score|
            @frame_score.push(frame_score)
        end

        @frame_score.length.times do |i|
            if strike_bonus?(i) then
                if @frame_score[i + 1].first == 10 && (i + 1) + 1 < @frame_score.length then
                    @bonus_score += @frame_score[i + 1].inject(:+) + @frame_score[i + 2].first
                else
                    @bonus_score += @frame_score[i + 1].inject(:+)
                end
            elsif spare_bonus?(i) then
                @bonus_score += @frame_score[i + 1].first
            end
           @total_score += @frame_score[i].inject(:+)
           @frame_total_score << @total_score + @bonus_score
        end
        @total_score += @bonus_score
    end
    
    def frame_score(index)
        @frame_total_score[index - 1]
    end
    
    private
    def strike_bonus?(index)
        @frame_score[index].first == 10 && index + 1 < @frame_score.length
    end
    def spare_bonus?(index)
        @frame_score[index].inject(:+) == 10 && index + 1 < @frame_score.length
    end
    
end
