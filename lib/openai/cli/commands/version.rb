# TODO print api version too ??
#
require "dry/cli"
require "openai/cli/version"

module OpenAI
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts OpenAI::CLI::VERSION
        end
      end
    end
  end
end
