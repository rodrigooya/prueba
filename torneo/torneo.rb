require_relative 'jugador'
require_relative 'teams'
class Torneo
    attr_accessor :teams
    def initialize
        @teams = Array.new
        @jugadores = Array.new
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
            team.total_points = 0
            team.calculate_total_points
        end
    end
    def listar_players
        players = Array.new
            for team in @teams       
                players.push(team.jugadores)
            end
        a = players.flatten
        c = a.sort {|a,b| b.player_points <=> a.player_points} 
        @jugadores = c
    end
    def busqueda_player rut
        for team in @teams
            team.jugadores.each do |jugador|
                if jugador.rut == rut
                    puts "#{jugador.name} #{jugador.player_points}"
                end
            end
        end
    end
    def modificar_win rut, match_win
        for team in @teams
            team.jugadores.each do |jugador|
                if jugador.rut == rut
                    jugador.match_win = match_win
                end
            end
            team.calculate_total_points
        end        
    end
    def win
        puts "El ganador es #{@jugadores[0].name} con un puntaje total de #{@jugadores[0].player_points}"
    end
    def tabla
        puts '-----------------------------------TABLA FINAL------------------------------------------------'
        puts 'codigo    nombre        edad      rut      cinturon   ganadas    empatadas   perdidas    total'
        @jugadores.each do |jugador|
            puts "#{jugador.code}   #{jugador.name}  #{jugador.age}     #{jugador.rut}      #{jugador.color}        #{jugador.match_win}        #{jugador.match_draw}           #{jugador.match_lose}         #{jugador.player_points}"
        end
    end
    def tabla_equipos
        puts '--------------TABLA EQUIPOS FINAL------------'
        @teams.each do |team|
            puts 'codigo        nombre        Total puntos Team'
            puts "#{team.code_team}          #{team.name_team}              #{team.total_points}" 
            puts "Lista de Jugadores #{team.name_team}"
            puts 'codigo    nombre        edad      rut      cinturon   ganadas    empatadas   perdidas    total'
            team.jugadores.each do |jugador|
                puts "#{jugador.code}   #{jugador.name}  #{jugador.age}     #{jugador.rut}      #{jugador.color}        #{jugador.match_win}        #{jugador.match_draw}           #{jugador.match_lose}         #{jugador.player_points}"
            end
        end
    end
end


torneo = Torneo.new
torneo.loadteams '0001','team 1'
torneo.loadteams '0002','team 2'
torneo.loadteams '0003','team 3'
torneo.loadteams '0004','team 4'
torneo.loadteams '0005','team 5'
torneo.loadteams '0006','team 6'
torneo.addplayers '0001','0011', 'Rodrigo Oyarzun ', 25, '00001-9', 'Negro ', 4,1,0
torneo.addplayers '0001','0012', 'Juan Perez      ', 24, '00002-6', 'Negro ', 2,2,1
torneo.addplayers '0001','0013', 'Pedro Muñoz     ', 21, '00003-7', 'Verde ', 1,3,1
torneo.addplayers '0001','0014', 'Alvaro Jara     ', 29, '00004-5', 'Azul  ', 1,1,3
torneo.addplayers '0002','0021', 'Jose Rojas      ', 20, '00005-7', 'Marron', 2,2,1
torneo.addplayers '0002','0022', 'Jorge Torres    ', 27, '00006-2', 'Negro ', 3,0,2
torneo.addplayers '0002','0023', 'Miguel Lopez    ', 28, '00007-5', 'Azul  ', 1,1,3
torneo.addplayers '0002','0024', 'Manuel Diaz     ', 23, '00008-6', 'Verde ', 1,2,2
torneo.addplayers '0003','0031', 'Andres Cisternas', 21, '00009-0', 'Negro ', 3,1,1
torneo.addplayers '0003','0032', 'Antonio Poblete ', 27, '00010-2', 'Marron', 3,0,2
torneo.addplayers '0003','0033', 'Tomas Caro      ', 28, '00011-5', 'Azul  ', 1,2,2
torneo.addplayers '0003','0034', 'Claudio Parra   ', 23, '00012-6', 'Verde ', 1,2,2
torneo.addplayers '0004','0041', 'jugador 1       ', 25, '00013-9', 'Negro ', 3,1,1
torneo.addplayers '0004','0042', 'jugador 2       ', 24, '00014-6', 'Negro ', 4,0,1
torneo.addplayers '0004','0043', 'jugador 3       ', 21, '00015-7', 'Verde ', 1,3,1
torneo.addplayers '0004','0044', 'jugador 4       ', 29, '00016-5', 'Azul  ', 1,2,2
torneo.addplayers '0005','0051', 'jugador 5       ', 20, '00017-7', 'Marron', 2,2,1
torneo.addplayers '0005','0052', 'jugador 6       ', 27, '00018-2', 'Negro ', 3,2,0
torneo.addplayers '0005','0053', 'jugador 7       ', 28, '00019-5', 'Azul  ', 1,1,3
torneo.addplayers '0005','0054', 'jugador 8       ', 23, '00020-6', 'Verde ', 1,2,2
torneo.addplayers '0006','0061', 'jugador 9       ', 21, '00021-0', 'Negro ', 3,1,1
torneo.addplayers '0006','0062', 'jugador 10      ', 27, '00022-2', 'Marron', 3,0,2
torneo.addplayers '0006','0063', 'jugador 11      ', 28, '00023-5', 'Azul  ', 1,2,2
torneo.addplayers '0006','0064', 'jugador 12      ', 23, '00024-6', 'Verde ', 1,2,2

torneo.listar_players

#torneo.busqueda_player('00009-0')
#torneo.modificar_win('00009-0',4)
#torneo.busqueda_player('00009-0')
#torneo.win
#torneo.tabla
#torneo.tabla_equipos






