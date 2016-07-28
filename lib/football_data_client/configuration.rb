module FootballDataClient
  module Configuration
    DEFAULT_API_KEY = nil
    DEFAULT_API_VERSION   = 'v1'
    DEFAULT_RESPONSE_CONTROL = 'full'

    API_ENDPOINT = 'http://api.football-data.org'

    attr_writer :api_version, :api_key, :response_control

    def configure
      raise "don't you wanna configure it?" unless block_given?
      yield self
      @api_version ||= DEFAULT_API_VERSION
      @response_control ||= DEFAULT_RESPONSE_CONTROL
    end
  end
end
