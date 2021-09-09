require_relative 'jugador'
class Teams
    attr_accessor :code_team, :name_team, :jugadores
    def initialize (code_team, name_team)
        @code_team = code_team
        @name_team = name_team
        @jugadores = Array.new
    end
    def loadjugadores code, name, age, rut, color, match_win, match_draw, match_lose
        jugador = Jugador.new code, name, age, rut, color, match_win, match_draw, match_lose
        @jugadores.push(jugador)
        @jugadores
    end
end
