require "dry/configurable"
require "ruby/openai"

module OpenAI
  module CLI

    class Config
      def self.configure
        Ruby::OpenAI.configure do |config|
          config.access_token = ENV["OPENAI_API_KEY"]
          config.organization_id = ENV["OPENAI_ORGANIZATION_ID"]
        end
      end

      # generate default config if does not exist from env or otherwise
      #
      # read config and provide values
      #
      # determine whether this is the first command execution
      #
      # write default configuration, copy a yaml file to location or something
      #
      # put api key into that configuration
      #
      # all this with error handling when config is malformed, with option to recreate default config
    end
  end
end
