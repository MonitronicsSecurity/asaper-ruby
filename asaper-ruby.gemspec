$:.unshift File.expand_path("../lib", __FILE__)
require 'asaper/version'

Gem::Specification.new do |s|
  s.name            = "asaper"
  s.version         = Asaper::VERSION
  s.author          = 'Jose Alvarez'
  s.email           = 'jalvarez@pernix.cr'
  s.description     = "A simple dsl for ASAPer"
  s.summary         = "A simple dsl for ASAPer"
  s.homepage        = "http://www.asaper.com"
  s.platform        = Gem::Platform::RUBY
  s.require_path    = "lib"
  s.test_files      = Dir['spec/**/*.rb']
  s.files           = `git ls-files -- lib/*`.split("\n")
  s.required_ruby_version = '>= 1.8.7'
end
