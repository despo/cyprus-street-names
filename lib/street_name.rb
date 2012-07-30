require 'json'

class StreetName
  attr_accessor :name, :postcode, :area

  def to_json
    { :name => self.name }.to_json
  end

end

