require 'spec_helper'

describe StreetNames::Database do

  let(:database) { StreetNames::Database.new "en" }

  it 'can store a hash of streets' do
    datastore = mock
    database.should_receive(:datastore).and_return(datastore)
    datastore.should_receive(:transaction)

    database.save! :streets => :streets
  end

  it 'can retrieve a hash of streets' do
    database.load_streets.first.should be_a Hash
  end

end
