# frozen_string_literal: true

require "pry-byebug"
require "openai/cli/cli"

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.mock_with :rspec
  config.expect_with :minitest
  config.example_status_persistence_file_path = ".rspec_status"
  config.order = "random"
  config.filter_run_when_matching :focus
  config.run_all_when_everything_filtered = true
end
