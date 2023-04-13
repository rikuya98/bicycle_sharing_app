require 'httparty'

class StravaService

    include HTTParty

    base_uri 'https://www.strava.com/api/v3'

    def initialize(access_token)
        @options = { headers: { 'Authorization' => "Bearer #{access_token}" } }
    end

    def fetch_activities 
        self.class.get('/athlete/activities', @options)
    end
end
