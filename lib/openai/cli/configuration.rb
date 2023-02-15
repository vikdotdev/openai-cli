require 'yaml'

module OpenAI
  module CLI
    class Configuration
      def default
        {
          auth: {
            access_token: ENV["OPENAI_API_KEY"],
            organization_id: ENV["OPENAI_ORGANIZATION_ID"]
          },
          completions: {
            model: "text-davinci-001",
            max_tokens: 150
          }
        }
      end

      def auth_configured?
        read.dig("auth", "access_token").present?
      end

      def read
        @read ||= YAML.load_file(file_path)
      end

      def write!(hash)
        File.write(file_path, YAML.dump(hash))
      end

      def write_default!
        write!(default)
      end

      def persisted?
        File.exist?(file_path)
      end

      def file_path
        File.join(Dir.home, ".config", "openai-cli", "config.yml")
      end
    end
  end
end
