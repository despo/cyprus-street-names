require 'spec_helper'
describe SpreadsheetParser do

  describe 'parse input file' do
    it 'load streets from spreadsheet' do
      parser = StreetNameParser.load

      parser.map(&:to_json).should include "{\"name\":\"Agias Marinas\",\"postcode\":8041,\"area\":\"Pafos\"}"
    end

    it 'can find the streets of a postcode' do
      puts StreetNameParser.find_by_postcode(8020).map(&:to_json).should include "{\"name\":\"Dimosthenous Georgiou\",\"postcode\":8020,\"area\":\"Pafos\"}", "{\"name\":\"Ellados Avenue\",\"postcode\":8020,\"area\":\"Pafos\"}"
    end
  end
end
