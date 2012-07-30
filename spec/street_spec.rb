require 'spec_helper'
describe Street do
  let(:street) do |street|
    street = Street.new
    street.name = 'Some street'
    street.postcode = '8021'
    street.area = 'Pafos'
    street
  end

  it 'sends the name as json' do
    street.to_json.should include "\"name\":\"Some street\""
  end

  it 'sends the postcode as json' do
    street.to_json.should include "\"postcode\":\"8021\""
  end

  it 'sends the area as json' do
    street.to_json.should include "\"area\":\"Pafos\""
  end

end
