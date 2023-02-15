require 'fileutils'
require "ruby/openai"

module OpenAI
  module CLI
    class Configurator
      include Deps[:configuration]

      def call
        ensure_config_file_path_exists!
        # File.delete(configuration.file_path) if configuration.persisted? # TODO delete
        configuration.write_default! unless configuration.persisted?
        configure_openai

        configuration
      end

      private

      def configure_openai
        Ruby::OpenAI.configure do |openai_config|
          openai_config.access_token = configuration.read.dig(:auth, :access_token)
          openai_config.organization_id = configuration.read.dig(:auth, :organization_id)
        end
      end

      def ensure_config_file_path_exists!
        File.dirname(configuration.file_path).then { FileUtils.mkdir_p(_1) }
      end
    end
  end
end
