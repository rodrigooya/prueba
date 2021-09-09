require_relative 'jugador'
class Teams
    attr_accessor :code_team, :name_team, :jugadores
    def initialize (code_team, name_team)
        @code_team = code_team
        @name_team = name_team
        @jugadores = Array.new
        @total_points = 0
    end
    def loadjugadores code, name, age, rut, color, match_win, match_draw, match_lose
        jugador = Jugador.new code, name, age, rut, color, match_win, match_draw, match_lose
        @jugadores.push(jugador)
        @jugadores
    end
    def calculate_total_points
        for jugador in @jugadores
            @total_points = @total_points + jugador.player_points
        end
        @total_points
    end
end
