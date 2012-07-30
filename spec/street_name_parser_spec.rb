require 'spec_helper'
describe StreetNames::Parser do
  describe 'parsing' do
    let (:street_parser) { StreetNames::Parser.new }

    before(:all) { street_parser.load_cities }

    it 'load streets from spreadsheet' do
      street_parser.streets.map(&:to_json).should include "{\"name\":\"Agias Marinas\",\"postcode\":8041,\"area\":\"Pafos\"}"
    end

    context '#finders' do
      it 'find streets by postcode' do
        street_parser.find_by_postcode(8020).map(&:to_json).should include "{\"name\":\"Dimosthenous Georgiou\",\"postcode\":8020,\"area\":\"Pafos\"}", "{\"name\":\"Ellados Avenue\",\"postcode\":8020,\"area\":\"Pafos\"}"
      end

      it 'find street names by  postcode' do
        address = { :name => "Dimosthenous Georgiou", :postcode => 8020, :area => "Pafos"}

        street_parser.find_by_street_name("Dimosthenous Georgiou").map(&:to_hash).should include address
      end
    end
  end

end
