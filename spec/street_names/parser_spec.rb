require 'spec_helper'
describe StreetNames::Parser do

  describe 'parsing' do
    let (:street_parser) { StreetNames::Parser.new }

    before(:all) { street_parser.load_cities }

    it 'load streets from spreadsheet' do
      street = { :name => "Agias Marinas", :postcode => 8041, :area => "Pafos"}

      street_parser.streets.map(&:to_json).should include street.to_json
    end
  end

end
