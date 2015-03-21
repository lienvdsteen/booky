module OmniAuth
  module Strategies
    class Openbibid < OmniAuth::Strategies::OAuth
      # Give your strategy a name.
      option :name, "openbibid"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, { :site => 'https://staging-mijn.bibliotheek.be/openbibid/rest',
                               :request_token_path => "/requestToken",
                               :access_token_path  => "/accessToken",
                               :authorize_path     => "/auth/authorize"}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { access_token.params[:userId] }

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
        user_id = access_token.params[:userId]
        body = access_token.get("/user/#{user_id}").body
        xml_doc = Nokogiri::XML(body) do |config|
          config.strict.noblanks
        end
        info = {}
        info[:uid] = user_id
        info[:email] = xml_doc.xpath('user/mbox').children.text
        info[:username] = xml_doc.xpath('user/nick').children.text
        info[:city] = xml_doc.xpath('user/city').children.text
        info[:created_on] = xml_doc.xpath('user/createdOn').children.text
        info[:gender] = xml_doc.xpath('user/gender').children.text
        info[:lastLogin] = xml_doc.xpath('user/lastLogin').children.text
        info[:status] = xml_doc.xpath('user/status').children.text
        info[:birthdate] = xml_doc.xpath('user/dob').children.text
        info
      end
    end
  end
end
