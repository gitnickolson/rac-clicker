# frozen_string_literal: true

$LOAD_PATH.unshift('./lib/')
require 'rspec'
require 'simplecov'
require 'ruby2d'

SimpleCov.start do
  add_filter '/spec/'
  enable_coverage :branch
  primary_coverage :branch
end

RSpec.configure do |config|
  config.color = true
  config.order = :rand
  config.disable_monkey_patching!
end

SimpleCov.minimum_coverage line: 100, branch: 100 if RSpec.configuration.files_to_run.length > 1
