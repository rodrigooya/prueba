class Jugador
    attr_accessor :code, :name, :age, :rut, :color, :match_win, :match_draw, :match_lose, :player_points
    def initialize (code, name, age, rut, color, match_win, match_draw, match_lose)
        @code = code
        @name = name
        @age = age
        @rut = rut
        @color = color
        @match_win = match_win
        @match_draw = match_draw
        @match_lose = match_lose
        @player_points = 0
    end
    def calculate_player_points 
        @player_points = @match_win*4 + @match_draw*3
    end
end