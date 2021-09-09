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
        @teams
    end
end