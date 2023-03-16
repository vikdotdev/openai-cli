# frozen_string_literal: true

require_relative "lib/openai/cli/version"

Gem::Specification.new do |spec|
  spec.name = "openai-cli"
  spec.version = OpenAI::CLI::VERSION
  spec.authors = ["Viktor Habchak"]
  spec.email = ["vikdotdev@gmail.com"]

  spec.summary = "Command line tool to interact with OpenAI APIs"
  spec.description = <<~DESCRIPTION
    Command line tool to interact with OpenAI APIs. Aims to be ergonomic and
    rely on GNU tools when possible.
  DESCRIPTION
  spec.homepage = "https://github.com/vikdotdev/openai-cli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/vikdotdev/openai-cli"
  spec.metadata["changelog_uri"] = "https://github.com/vikdotdev/openai-cli/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-auto_inject"
  spec.add_dependency "dry-cli", "~> 1.0"
  spec.add_dependency "dry-configurable"
  spec.add_dependency "dry-container"
  spec.add_dependency "dry-types"
  spec.add_dependency "dry-monads", "~> 1.3"
  spec.add_dependency "os"
  spec.add_dependency "ruby-openai"
  spec.add_dependency "sqlite"

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rspec"
end
