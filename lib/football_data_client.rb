require_relative 'football_data_client/configuration'
require 'faraday'
require 'json'


module FootballDataClient
  extend Configuration
  class << self


    def competitions(seasons = nil)
      seasons ? path = "/#{@api_version}/competitions/?season=#{seasons}" : path = "/#{@api_version}/competitions/"
      response = get(path)
      JSON.parse(response.body)
    end

    def competitionsTeam(id)
      path = "/#{@api_version}/competitions/#{id}/teams"
      response = get(path)
      JSON.parse(response.body)
    end

    def leagueTable(id, matchday = nil)
      matchday ? path = "/#{@api_version}/competitions/#{id}/leagueTable?matchday=#{matchday}" : path = "/#{@api_version}/competitions/#{id}/leagueTable"
      response = get(path)
      JSON.parse(response.body)
    end

    def fixture(id, matchday = nil)
      matchday ? path = "/#{@api_version}/competitions/#{id}/fixtures?matchday=#{matchday}" : path = "/#{@api_version}/competitions/#{id}/fixtures"
      response = get(path)
      JSON.parse(response.body)
    end

    def teamFixtures(id)
      path = "/#{@api_version}/teams/#{id}/fixtures"
      response = get(path)
      JSON.parse(response.body)
    end

    def team(id)
      path = "/#{@api_version}/teams/#{id}"
      response = get(path)
      JSON.parse(response.body)
    end

    def players(id)
      path = "/#{@api_version}/teams/#{id}/players"
      response = get(path)
      JSON.parse(response.body)
    end


    def fixtures(id=nil)
      id ? path = "/#{@api_version}/fixtures/#{id}" : path = "/#{@api_version}/fixtures/"
      response = get(path)
      JSON.parse(response.body)
    end


    private

    def connection
      @connection ||= Faraday.new(url: API_ENDPOINT, headers: {'X-Auth-Token' => @api_key, 'X-Response-Control' => @response_control})
    end

    def get(path)
      connection.get(path)
    end
  end
end
