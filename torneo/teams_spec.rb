require_relative 'jugador'
require_relative 'teams'

RSpec.describe Teams do
    context 'initialize teams class' do
        before(:each) do
            @team = Teams.new '0001', 'team 1'
        end
        it '#new' do
            expect(@team).to be_an_instance_of(Teams)
        end        
        it 'new#code_team' do
            expect(@team.code_team).to eq('0001')
        end       
        it 'new#name_team' do
            expect(@team.name_team).to eq('team 1')
        end
    end
    context 'load jugadores' do
        before(:each) do
            @team = Teams.new '0001', 'team 1'
        end
        it '#load' do
            jugador = Jugador.new '0001', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 3,1,1
            @team.loadjugadores '0001', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 3,1,1
            expect(@team.jugadores[0].name).to eq('Rodrigo Oyarzun')
        end 
    end
end
