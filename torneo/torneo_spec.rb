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
        it 'load' do
            team = Teams.new '0001','team 1'
            @torneo.loadteams '0001', 'team 1' 
            expect(@torneo.teams[0].code_team).to eq('0001')
        end
    end
end
