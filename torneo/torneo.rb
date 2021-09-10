require_relative 'jugador'
require_relative 'teams'
class Torneo
    attr_accessor :teams
    def initialize
        @teams = Array.new
    end
    def loadteams code_team, name_team
        team = Teams.new code_team, name_team
        @teams.push(team)
    end
    def addplayers code_team, code, name, age, rut, color, match_win, match_draw, match_lose
        for team in @teams
            if team.code_team == code_team
                team.loadjugadores code, name, age, rut, color, match_win, match_draw, match_lose
            end
        end
        for team in @teams
            team.calculate_total_points
        end
    end
    def busqueda_player rut
        for team in @teams
            team.busqueda(rut)
        end
    end

    def generar_player_list 
        players = Array.new
        for team in @teams       
            players.push(team.jugadores)
        end
        a = players.flatten
        c = a.sort {|a,b| b.player_points <=> a.player_points} 
        puts "code  nombre          edad rut cinturon    ganadas empatadas   perdidas    puntos totales"
        c.each do |i|
            puts "#{i.code}  #{i.name}  #{i.age}    #{i.rut} #{i.color}     #{i.match_win}  #{i.match_draw}     #{i.match_lose}     #{i.player_points}"
        end
        puts "El campeon es el Señor #{c[0].name} con un puntaje de #{c[0].player_points}"
    end
end


torneo = Torneo.new
torneo.loadteams '0001','team 1'
torneo.loadteams '0002','tamm 2'
torneo.loadteams '0003','tamm 3'

torneo.addplayers '0001','0011', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 4,1,0
torneo.addplayers '0001','0012', 'Juan Perez', 24, '00002-6', 'Negro', 2,2,1
torneo.addplayers '0001','0013', 'Pedro Muñoz', 21, '00003-7', 'Verde', 1,3,1
torneo.addplayers '0001','0014', 'Alvaro Jara', 29, '00004-5', 'Azul', 1,1,3
torneo.addplayers '0002','0021', 'Jose Rojas', 20, '00005-7', 'Marron', 2,2,1
torneo.addplayers '0002','0022', 'Jorge Torres', 27, '00006-2', 'Negro', 3,0,2
torneo.addplayers '0002','0023', 'Miguel Lopez', 28, '00007-5', 'Azul', 1,1,3
torneo.addplayers '0002','0024', 'Manuel Diaz', 23, '00008-6', 'Verde', 1,2,2
torneo.addplayers '0003','0031', 'Andres Cisternas', 21, '00009-0', 'Negro', 3,1,1
torneo.addplayers '0003','0032', 'Antonio Poblete', 27, '00010-2', 'Marron', 3,0,2
torneo.addplayers '0003','0033', 'Tomas Caro', 28, '000011-5', 'Azul', 1,2,2
torneo.addplayers '0003','0034', 'Claudio Parra', 23, '000012-6', 'Verde', 1,2,2

#torneo.busqueda_player('00009-0')
torneo.generar_player_list







