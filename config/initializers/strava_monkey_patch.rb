module OmniAuth
  module Strategies
    class Strava
      def token_params
        super.tap do |params|
          params[:client_id] = options[:client_id]
          params[:client_secret] = options[:client_secret]
        end
      end
    end
  end
end
