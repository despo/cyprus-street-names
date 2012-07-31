$:.push File.expand_path("../lib", __FILE__)
require "street_names/version"

Gem::Specification.new do |s|
  s.name        = "cyprus-street-names"
  s.version     = StreetNames::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Despo Pentara"
  s.email       = "despo@extractmethod.com"
  s.homepage    = "https://github.com/despo/cyprus-paf"
  s.summary     = "Cyprus's Street Names."
  s.description = "Cyprus's Street Names."
  s.required_ruby_version = '>= 1.9.2'

  s.licenses = ["MIT"]

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {spec}/*`.split("\n")
  s.executables        = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths      = ["lib"]

  s.add_dependency "spreadsheet", "~> 0.7.3"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 2.11.0"
end
