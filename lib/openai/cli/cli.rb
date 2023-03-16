# frozen_string_literal: true

require 'pry-byebug'

require "openai/cli/container"
require "openai/cli/configurator"
require "openai/cli/configuration"

require "openai/cli/api_client"

require "openai/cli/commands/version"
require "openai/cli/commands/config"
require "openai/cli/commands/complete"
require "openai/cli/commands/status"

require "openai/cli/operations/complete"
require "openai/cli/operations/interactive_complete"

OpenAI::CLI::Container.resolve(:configurator).call

module OpenAI
  module CLI
    module Commands
      register "complete", Complete, aliases: ["c"]
      register "status", Status
      register "config", Config
      register "version", Version, aliases: ["v", "-v", "--version"]
    end
  end
end

