require 'spec_helper'
describe StreetNames::Parser do
  describe 'parsing' do
    let (:street_parser) { StreetNames::Parser.new }

    before(:all) { street_parser.load_cities }

    it 'load streets from spreadsheet' do
      street = { :name => "Agias Marinas", :postcode => 8041, :area => "Pafos"}

      street_parser.streets.map(&:to_json).should include street.to_json
    end

    context '#finders' do
      it 'find streets by postcode' do
        street = { :name => "Dimosthenous Georgiou", :postcode => 8020, :area => "Pafos"}

        street_parser.find_by_postcode(8020).map(&:to_json).should include street.to_json
      end

      it 'find street  by street name' do
        street = { :name => "Dimosthenous Georgiou", :postcode => 8020, :area => "Pafos"}

        street_parser.find_by_street_name("Dimosthenous Georgiou").map(&:to_json).should include street.to_json
      end

      it 'find area by street name' do
        street = { :name => "Dimosthenous Georgiou", :postcode => 8020, :area => "Pafos"}

        street_parser.find_by_area("Pafos").map(&:to_json).should include street.to_json
      end
    end
  end

end
