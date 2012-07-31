require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_path = 'rspec'
  t.rspec_opts = ["-cfd"]
end

task :default => :spec

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift File.dirname($LOAD_PATH.first)
require 'street_names'
require 'street'

namespace :load_data do
  task :en do
    load_street_names_for_locale "en"
  end

  task :gr do
    load_street_names_for_locale "gr"
  end
end

def load_street_names_for_locale locale
  parser = StreetNames::Parser.new locale
  parser.load_cities
  parser.save!
end
