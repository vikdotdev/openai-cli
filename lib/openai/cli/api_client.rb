require "ruby/openai"

module OpenAI
  module CLI
    class APIClient
      def initialize
        @forwardee = OpenAI::Client.new
      end

      def method_missing(name, **args)
        @forwardee.send(name, **args)
      end
    end
  end
end
