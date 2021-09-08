class Jugador
    attr_accessor :code, :name, :age, :rut, :color, :match_win, :match_draw, :match_lose
    def initialize (code, name, age, rut, color, match_win, match_draw, match_lose)
        @code = code
        @name = name
        @age = age
        @rut = rut
        @color = color
        @match_win = match_win
        @match_draw = match_draw
        @match_lose = match_lose
    end
end