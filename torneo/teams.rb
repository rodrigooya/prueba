require_relative 'jugador'
class Teams
    attr_accessor :code_team, :name_team, :jugadores, :total_points
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
            @total_points = @total_points + jugador.calculate_player_points
        end
    end
end

team = Teams.new '001','team1'
team.loadjugadores '0001', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 3,1,1
team.loadjugadores '0002', 'Alonso Oyarzun', 22, '00002-6', 'Negro', 2,2,1
team.calculate_total_points
