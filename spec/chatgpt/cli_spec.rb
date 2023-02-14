# frozen_string_literal: true

RSpec.describe OpenAI::CLI do
  it "has a version number" do
    expect(OpenAI::CLI::VERSION).not_to be nil
  end
end
