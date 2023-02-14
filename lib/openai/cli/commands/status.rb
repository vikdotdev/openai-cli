require "dry/cli"

module OpenAI
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Status < Dry::CLI::Command
        desc "Show CLI status"

        example [
          "openai status"
        ]

        def call(**)
          puts "status command called"
        end

        # Display token usage.
        # opanai status
      end
    end
  end
end
