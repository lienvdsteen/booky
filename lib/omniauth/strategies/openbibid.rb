module OmniAuth
  module Strategies
    class Openbibid < OmniAuth::Strategies::OAuth
      # Give your strategy a name.
      option :name, "openbibid"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, { :site => 'https://mijn.bibliotheek.be/openbibid/rest',
                               :request_token_path => "/requestToken",
                               :access_token_path  => "/accessToken",
                               :authorize_path     => "/auth/authorize"}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { request.params['userId'] }

      info do
        {
          :name => raw_info['name'],
          :location => raw_info['city']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get("/user/#{uid}")).body
      end
    end
  end
end
