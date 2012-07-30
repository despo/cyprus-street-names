require 'spec_helper'
describe SpreadsheetParser do

  describe 'parse input file' do
    it 'load streets from spreadsheet' do
      parser = StreetNameParser.load

      parser.map(&:to_json).should include "{\"name\":\"Agias Marinas\",\"postcode\":8041,\"area\":\"Pafos\"}"
    end
  end
end
