require 'dry/monads'

module OpenAI
  module CLI
    module Operations
      class Complete
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)
        include Deps["configuration", "api_client"]

        def call(message, **opts)
          response = yield request(message, **opts)

          Success(response)
        end

        private

        def request(message, **opts)
          response = api_client.completions(
            parameters: {
              model: opts[:model] || configuration.read.dig(:completions, :model),
              prompt: message,
              max_tokens: (opts[:max_tokens] || configuration.read.dig(:completions, :max_tokens)).to_i
            }
          )

          if response.success?
            Success(response)
          else
            Failure([:api_error, response])
          end
        end
      end
    end
  end
end
