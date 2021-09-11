require_relative 'jugador'
require_relative 'teams'
require_relative 'torneo'

RSpec.describe Torneo do
    context 'initialize torneo class' do
        before(:each) do
            @torneo = Torneo.new
        end
        it '#new' do
            expect(@torneo).to be_an_instance_of(Torneo)
        end
    end
    context 'loadteams' do
        before(:each) do
            @torneo = Torneo.new
        end
        it '#load' do
            team = Teams.new '0001','team 1'
            @torneo.loadteams '0001', 'team 1' 
            expect(@torneo.teams[0].code_team).to eq('0001')
        end
        it '#loadplayers' do
            team = Teams.new '0001','team 1'
            @torneo.loadteams '0001', 'team 1'
            jugador = @torneo.addplayers '0001','0011', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 3,1,1
            expect(jugador[0].jugadores[0].name).to eq('Rodrigo Oyarzun')
        end
        it '#generar_listado_jugadores' do
            team = Teams.new '0001','team 1'
            @torneo.loadteams '0001', 'team 1'
            @torneo.loadteams '0002','tamm 2'
            @torneo.loadteams '0003','tamm 3'
            @torneo.addplayers '0001','0011', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 4,1,0
            @torneo.addplayers '0001','0012', 'Juan Perez', 24, '00002-6', 'Negro', 2,2,1
            @torneo.addplayers '0001','0013', 'Pedro Muñoz', 21, '00003-7', 'Verde', 1,3,1
            @torneo.addplayers '0001','0014', 'Alvaro Jara', 29, '00004-5', 'Azul', 1,1,3
            @torneo.addplayers '0002','0021', 'Jose Rojas', 20, '00005-7', 'Marron', 2,2,1
            @torneo.addplayers '0002','0022', 'Jorge Torres', 27, '00006-2', 'Negro', 3,0,2
            @torneo.addplayers '0002','0023', 'Miguel Lopez', 28, '00007-5', 'Azul', 1,1,3
            @torneo.addplayers '0002','0024', 'Manuel Diaz', 23, '00008-6', 'Verde', 1,2,2
            @torneo.addplayers '0003','0031', 'Andres Cisternas', 21, '00009-0', 'Negro', 3,1,1
            @torneo.addplayers '0003','0032', 'Antonio Poblete', 27, '00010-2', 'Marron', 3,0,2
            @torneo.addplayers '0003','0033', 'Tomas Caro', 28, '000011-5', 'Azul', 1,2,2
            @torneo.addplayers '0003','0034', 'Claudio Parra', 23, '000012-6', 'Verde', 1,2,2
            jugador = @torneo.listar_players 
            expect(jugador[0].rut).to eq("00001-9")
        end
        it '#busqueda' do
            team = Teams.new '0001','team 1'
            @torneo.loadteams '0001', 'team 1'
            @torneo.loadteams '0002','tamm 2'
            @torneo.loadteams '0003','tamm 3'
            @torneo.addplayers '0001','0011', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 4,1,0
            @torneo.addplayers '0001','0012', 'Juan Perez', 24, '00002-6', 'Negro', 2,2,1
            @torneo.addplayers '0001','0013', 'Pedro Muñoz', 21, '00003-7', 'Verde', 1,3,1
            @torneo.addplayers '0001','0014', 'Alvaro Jara', 29, '00004-5', 'Azul', 1,1,3
            @torneo.addplayers '0002','0021', 'Jose Rojas', 20, '00005-7', 'Marron', 2,2,1
            @torneo.addplayers '0002','0022', 'Jorge Torres', 27, '00006-2', 'Negro', 3,0,2
            @torneo.addplayers '0002','0023', 'Miguel Lopez', 28, '00007-5', 'Azul', 1,1,3
            @torneo.addplayers '0002','0024', 'Manuel Diaz', 23, '00008-6', 'Verde', 1,2,2
            @torneo.addplayers '0003','0031', 'Andres Cisternas', 21, '00009-0', 'Negro', 3,1,1
            @torneo.addplayers '0003','0032', 'Antonio Poblete', 27, '00010-2', 'Marron', 3,0,2
            @torneo.addplayers '0003','0033', 'Tomas Caro', 28, '000011-5', 'Azul', 1,2,2
            @torneo.addplayers '0003','0034', 'Claudio Parra', 23, '000012-6', 'Verde', 1,2,2
            jugador = @torneo.busqueda_player '00001-9'
            expect(jugador[0].jugadores[0].rut).to eq("00001-9")
        end
        it '#modificar win' do
            team = Teams.new '0001','team 1'
            @torneo.loadteams '0001', 'team 1'
            @torneo.loadteams '0002','tamm 2'
            @torneo.loadteams '0003','tamm 3'
            @torneo.addplayers '0001','0011', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 4,1,0
            @torneo.addplayers '0001','0012', 'Juan Perez', 24, '00002-6', 'Negro', 2,2,1
            @torneo.addplayers '0001','0013', 'Pedro Muñoz', 21, '00003-7', 'Verde', 1,3,1
            @torneo.addplayers '0001','0014', 'Alvaro Jara', 29, '00004-5', 'Azul', 1,1,3
            @torneo.addplayers '0002','0021', 'Jose Rojas', 20, '00005-7', 'Marron', 2,2,1
            @torneo.addplayers '0002','0022', 'Jorge Torres', 27, '00006-2', 'Negro', 3,0,2
            @torneo.addplayers '0002','0023', 'Miguel Lopez', 28, '00007-5', 'Azul', 1,1,3
            @torneo.addplayers '0002','0024', 'Manuel Diaz', 23, '00008-6', 'Verde', 1,2,2
            @torneo.addplayers '0003','0031', 'Andres Cisternas', 21, '00009-0', 'Negro', 3,1,1
            @torneo.addplayers '0003','0032', 'Antonio Poblete', 27, '00010-2', 'Marron', 3,0,2
            @torneo.addplayers '0003','0033', 'Tomas Caro', 28, '000011-5', 'Azul', 1,2,2
            @torneo.addplayers '0003','0034', 'Claudio Parra', 23, '000012-6', 'Verde', 1,2,2
            jugador = @torneo.modificar_win '00001-9', 4
            expect(jugador[0].jugadores[0].player_points).to eq(19)
        end
        it '#print ganador del torneo' do
        team = Teams.new '0001','team 1'
        @torneo.loadteams '0001', 'team 1'
        @torneo.loadteams '0002','tamm 2'
        @torneo.loadteams '0003','tamm 3'
        @torneo.addplayers '0001','0011', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 4,1,0
        @torneo.addplayers '0001','0012', 'Juan Perez', 24, '00002-6', 'Negro', 2,2,1
        @torneo.addplayers '0001','0013', 'Pedro Muñoz', 21, '00003-7', 'Verde', 1,3,1
        @torneo.addplayers '0001','0014', 'Alvaro Jara', 29, '00004-5', 'Azul', 1,1,3
        @torneo.addplayers '0002','0021', 'Jose Rojas', 20, '00005-7', 'Marron', 2,2,1
        @torneo.addplayers '0002','0022', 'Jorge Torres', 27, '00006-2', 'Negro', 3,0,2
        @torneo.addplayers '0002','0023', 'Miguel Lopez', 28, '00007-5', 'Azul', 1,1,3
        @torneo.addplayers '0002','0024', 'Manuel Diaz', 23, '00008-6', 'Verde', 1,2,2
        @torneo.addplayers '0003','0031', 'Andres Cisternas', 21, '00009-0', 'Negro', 3,1,1
        @torneo.addplayers '0003','0032', 'Antonio Poblete', 27, '00010-2', 'Marron', 3,0,2
        @torneo.addplayers '0003','0033', 'Tomas Caro', 28, '000011-5', 'Azul', 1,2,2
        @torneo.addplayers '0003','0034', 'Claudio Parra   ', 23, '00012-6', 'Verde ', 1,2,2
        @torneo.listar_players
        expect{@torneo.win}.to output("El ganador es Rodrigo Oyarzun con un puntaje total de 19\n").to_stdout        
        end
        it '#print tabla del torneo' do
        team = Teams.new '0001','team 1'
        @torneo.loadteams '0001', 'team 1'
        @torneo.loadteams '0002','tamm 2'
        @torneo.loadteams '0003','tamm 3'
        @torneo.addplayers '0001','0011', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 4,1,0
        @torneo.addplayers '0001','0012', 'Juan Perez', 24, '00002-6', 'Negro', 2,2,1
        @torneo.addplayers '0001','0013', 'Pedro Muñoz', 21, '00003-7', 'Verde', 1,3,1
        @torneo.addplayers '0001','0014', 'Alvaro Jara', 29, '00004-5', 'Azul', 1,1,3
        @torneo.addplayers '0002','0021', 'Jose Rojas', 20, '00005-7', 'Marron', 2,2,1
        @torneo.addplayers '0002','0022', 'Jorge Torres', 27, '00006-2', 'Negro', 3,0,2
        @torneo.addplayers '0002','0023', 'Miguel Lopez', 28, '00007-5', 'Azul', 1,1,3
        @torneo.addplayers '0002','0024', 'Manuel Diaz', 23, '00008-6', 'Verde', 1,2,2
        @torneo.addplayers '0003','0031', 'Andres Cisternas', 21, '00009-0', 'Negro', 3,1,1
        @torneo.addplayers '0003','0032', 'Antonio Poblete', 27, '00010-2', 'Marron', 3,0,2
        @torneo.addplayers '0003','0033', 'Tomas Caro', 28, '000011-5', 'Azul', 1,2,2
        @torneo.addplayers '0003','0034', 'Claudio Parra   ', 23, '00012-6', 'Verde ', 1,2,2
        @torneo.listar_players
        msg = <<~PUBLICHED
        -----------------------------------TABLA FINAL------------------------------------------------
        codigo    nombre        edad      rut      cinturon   ganadas    empatadas   perdidas    total
        0011   Rodrigo Oyarzun  25     00001-9      Negro        4        1           0         19
        0031   Andres Cisternas  21     00009-0      Negro        3        1           1         15
        0012   Juan Perez  24     00002-6      Negro        2        2           1         14
        0021   Jose Rojas  20     00005-7      Marron        2        2           1         14
        0013   Pedro Muñoz  21     00003-7      Verde        1        3           1         13
        0022   Jorge Torres  27     00006-2      Negro        3        0           2         12
        0032   Antonio Poblete  27     00010-2      Marron        3        0           2         12
        0024   Manuel Diaz  23     00008-6      Verde        1        2           2         10
        0033   Tomas Caro  28     000011-5      Azul        1        2           2         10
        0034   Claudio Parra     23     00012-6      Verde         1        2           2         10
        0014   Alvaro Jara  29     00004-5      Azul        1        1           3         7
        0023   Miguel Lopez  28     00007-5      Azul        1        1           3         7
        PUBLICHED
        expect{@torneo.tabla}.to output(msg).to_stdout        
        end
        it '#print tabla de teams y jugadores' do
        team = Teams.new '0001','team 1'
        @torneo.loadteams '0001', 'team 1'
        @torneo.loadteams '0002','tamm 2'
        @torneo.loadteams '0003','tamm 3'
        @torneo.addplayers '0001','0011', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 4,1,0
        @torneo.addplayers '0001','0012', 'Juan Perez', 24, '00002-6', 'Negro', 2,2,1
        @torneo.addplayers '0001','0013', 'Pedro Muñoz', 21, '00003-7', 'Verde', 1,3,1
        @torneo.addplayers '0001','0014', 'Alvaro Jara', 29, '00004-5', 'Azul', 1,1,3
        @torneo.addplayers '0002','0021', 'Jose Rojas', 20, '00005-7', 'Marron', 2,2,1
        @torneo.addplayers '0002','0022', 'Jorge Torres', 27, '00006-2', 'Negro', 3,0,2
        @torneo.addplayers '0002','0023', 'Miguel Lopez', 28, '00007-5', 'Azul', 1,1,3
        @torneo.addplayers '0002','0024', 'Manuel Diaz', 23, '00008-6', 'Verde', 1,2,2
        @torneo.addplayers '0003','0031', 'Andres Cisternas', 21, '00009-0', 'Negro', 3,1,1
        @torneo.addplayers '0003','0032', 'Antonio Poblete', 27, '00010-2', 'Marron', 3,0,2
        @torneo.addplayers '0003','0033', 'Tomas Caro', 28, '000011-5', 'Azul', 1,2,2
        @torneo.addplayers '0003','0034', 'Claudio Parra   ', 23, '00012-6', 'Verde ', 1,2,2
        @torneo.listar_players
        msg = <<~PUBLICHED
        --------------TABLA EQUIPOS FINAL------------
        codigo        nombre        Total puntos Team
        0001          team 1              53
        Lista de Jugadores team 1
        codigo    nombre        edad      rut      cinturon   ganadas    empatadas   perdidas    total
        0011   Rodrigo Oyarzun  25     00001-9      Negro        4        1           0         19
        0012   Juan Perez  24     00002-6      Negro        2        2           1         14
        0013   Pedro Muñoz  21     00003-7      Verde        1        3           1         13
        0014   Alvaro Jara  29     00004-5      Azul        1        1           3         7
        codigo        nombre        Total puntos Team
        0002          tamm 2              43
        Lista de Jugadores tamm 2
        codigo    nombre        edad      rut      cinturon   ganadas    empatadas   perdidas    total
        0021   Jose Rojas  20     00005-7      Marron        2        2           1         14
        0022   Jorge Torres  27     00006-2      Negro        3        0           2         12
        0023   Miguel Lopez  28     00007-5      Azul        1        1           3         7
        0024   Manuel Diaz  23     00008-6      Verde        1        2           2         10
        codigo        nombre        Total puntos Team
        0003          tamm 3              47
        Lista de Jugadores tamm 3
        codigo    nombre        edad      rut      cinturon   ganadas    empatadas   perdidas    total
        0031   Andres Cisternas  21     00009-0      Negro        3        1           1         15
        0032   Antonio Poblete  27     00010-2      Marron        3        0           2         12
        0033   Tomas Caro  28     000011-5      Azul        1        2           2         10
        0034   Claudio Parra     23     00012-6      Verde         1        2           2         10
        PUBLICHED
        expect{@torneo.tabla_equipos}.to output(msg).to_stdout 
        end
    end
end
