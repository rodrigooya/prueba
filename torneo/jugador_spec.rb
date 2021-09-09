require_relative 'jugador'

RSpec.describe Jugador do
    context 'initialize jugadores class' do
        before(:each) do
            @jugador = Jugador.new '0001', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 3,1,1
        end
        it '#new' do
            expect(@jugador).to be_an_instance_of(Jugador)
        end
        it 'new#code' do
            expect(@jugador.code).to eq('0001')
        end       
        it 'new#name' do
            expect(@jugador.name).to eq('Rodrigo Oyarzun')
        end
        it 'new#age' do
            expect(@jugador.age).to eq(25)
        end
        it 'new#rut' do
            expect(@jugador.rut).to eq('00001-9')
        end
        it 'new#color' do
            expect(@jugador.color).to eq('Negro')
        end
        it 'new#match_win' do
            expect(@jugador.match_win).to eq(3)
        end
        it 'new#match_draw' do
            expect(@jugador.match_draw).to eq(1)
        end
        it 'new#match_lose' do
            expect(@jugador.match_lose).to eq(1)
        end
    end
    context 'calculate points player' do
        before(:each) do
            @jugador = Jugador.new '0001', 'Rodrigo Oyarzun', 25, '00001-9', 'Negro', 3,1,1
        end
        it '#new' do
            expect(@jugador.player_points).to be(15)
        end
    end
end