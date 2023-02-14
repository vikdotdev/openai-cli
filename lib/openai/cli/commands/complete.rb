require "dry/cli"

module OpenAI
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Complete < Dry::CLI::Command
        desc "Send requests to OpenAI completion endpoint"

        argument :message, required: false, desc: "Prompt message"
        option :max_tokens, required: false, default: 100, desc: <<~DESC
          Maximum amount of tokens permitted in the response
        DESC
        option :interactive, required: false, default: true, desc: "Interactive mode"
        option :model, required: false, desc: "Specify OpenAI model"

        example [
          'openai complete "What is the meaning of life?" # A single completion',
          "openai complete -i # Enter interactive mode"
        ]

        def call(message: "", **opts)
          # either message or interactive mode should be present
          # model should be read from the configuration
          puts "complete command called with arguments: #{message.inspect}, #{opts.inspect}"
        end
      end
    end
  end
end
