require "dry/cli"

module OpenAI
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Complete < Dry::CLI::Command
        include Deps[:configuration, :api_client]

        desc "Send requests to OpenAI completion endpoint"

        argument :message, required: true, desc: "Prompt message"
        # TODO how to pass this properly here?
        option :max_tokens, required: false, default: OpenAI::CLI::Container.resolve(:configuration).read.dig(:completions, :max_tokens), desc: <<~DESC

          Maximum amount of tokens permitted in the response
        DESC
        # option :interactive, required: false, default: true, desc: "Interactive mode"
        # option :model, required: false, desc: "Specify OpenAI model"

        example [
          'openai complete "What is the meaning of life?" # A single completion',
          # "openai complete -i # Enter interactive mode"
        ]

        def call(message: "", **opts)
          response = api_client.completions(
            parameters: {
              model: configuration.read.dig(:completions, :model),
              prompt: message,
              max_tokens: (opts[:max_tokens] || configuration.read.dig(:completions, :max_tokens)).to_i
            }
          )

          response["choices"].each do |choice|
            puts choice["text"]
          end
          # either message or interactive mode should be present
          # model should be read from the configuration
          puts "complete command called with arguments: #{message.inspect}, #{opts.inspect}"
        end
      end
    end
  end
end
