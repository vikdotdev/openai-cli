# frozen_string_literal: true

require "openai/cli/config"

OpenAI::CLI::Config.configure

require "openai/cli/commands/version"
require "openai/cli/commands/complete"
require "openai/cli/commands/status"
require "openai/cli/commands/config"

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

