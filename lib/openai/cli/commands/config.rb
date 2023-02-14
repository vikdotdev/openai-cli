require "dry/cli"

module OpenAI
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Config < Dry::CLI::Command
        desc "Configure the CLI"

        option :restore_default, desc: <<~DESC
          Restores configuration to default
        DESC

        def call(**opts)
          puts "config command called with arguments: #{opts.inspect}"
        end

        # This should attempt to fetch OPENAI_API_KEY if available
        # openai config auth -k <your-api-key>
        #
        # openai config completion -m text-davince-001
      end
    end
  end
end


