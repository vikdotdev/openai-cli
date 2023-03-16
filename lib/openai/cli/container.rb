require 'dry/container'
require 'dry/auto_inject'

module OpenAI
  module CLI
    class Container
      extend Dry::Container::Mixin

      register "configurator" do
        Configurator.new
      end

      register "configuration" do
        Configuration.new
      end

      register "api_client" do
        APIClient.new
      end

      register "operations.complete" do
        Operations::Complete.new
      end

      register "operations.interactive_complete" do
        Operations::InteractiveComplete.new
      end

    end
  end
end

Deps = Dry::AutoInject(OpenAI::CLI::Container)
