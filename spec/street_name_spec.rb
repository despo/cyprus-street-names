require 'spec_helper'
describe StreetName do
  it 'sends the name as json' do
    street_name = StreetName.new
    street_name.name = 'Some street'
    street_name.to_json.should eq "{\"name\":\"Some street\"}"
  end
end
