require "dry/cli"
require 'dry/monads'

module OpenAI
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Complete < Dry::CLI::Command
        include Dry::Monads[:result]
        include Deps[
          "configuration",
          "operations.complete",
          "operations.interactive_complete"
        ]

        desc "Send requests to OpenAI completion endpoint"

        argument :message, required: false, desc: "Prompt message"
        option :max_tokens, required: false, desc: <<~DESC
          Maximum amount of tokens permitted in the response
        DESC
        option :interactive, required: false, type: :flag, default: false, desc: "Interactive mode"
        option :model, required: false, desc: "Specify OpenAI model"

        example [
          'openai complete "What is the meaning of life?" # A single completion',
          "openai complete --interactive # Enter interactive mode",
          "openai complete # Enter interactive mode"
        ]

        def call(message: "", **opts)
          if opts[:interactive] || message.empty?
            interactive_complete.call(message, **opts)
          else
            case complete.call(message, **opts)
            in Success(response)
              response["choices"].each do |choice|
                puts choice["text"]
              end
            in Failure([:api_error, _])
              puts response
            end
          end
        end
      end
    end
  end
end
