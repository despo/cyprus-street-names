require 'json'

class Street
  attr_accessor :name, :postcode, :area

  def to_json
    { :name => name, :postcode => postcode, :area => area }.to_json
  end

end

