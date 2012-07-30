require 'spec_helper'

describe StreetNames::Database do

  let(:streets) { [ { :name => "Road A" }, { :name => "Road B" }, { :name => "Not road C"} ] }
  let(:database) { StreetNames::Database.new }

  before(:all) do
    `rm ./spec/database.dat`
    database.should_receive(:path).and_return("./spec/database.dat")
  end

  it 'is nil' do
    database.load_streets.should == nil
  end

  it 'can store a hash of streets' do
    database.save! :streets =>  streets

    database.load_streets.should == streets
  end

  it 'can retrieve a hash of streets' do

    database.load_streets.should == streets
  end

end
