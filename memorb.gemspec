# frozen_string_literal: true

require File.expand_path('../lib/memorb/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'memorb'
  s.version     = Memorb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ['Patrick Rebsch']
  s.email       = ['pjrebsch@gmail.com']
  s.homepage    = 'https://github.com/pjrebsch/memorb'
  s.summary     = 'Memoization made easy'
  s.description = <<~TXT
    Memorb makes instance method memoization easy to set up and use.
  TXT

  s.required_ruby_version     = '~> 2.5'
  s.required_rubygems_version = '~> 3.0'

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_dependency 'concurrent-ruby', '~> 1.1'

  s.require_paths = ['lib']
  s.files         = `git ls-files`.split("\n")
end
