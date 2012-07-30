require 'json'
require 'spreadsheet'

class Street
  attr_accessor :name, :postcode, :area

  def initialize params=nil
    parse_parameters(params) unless params.nil?
  end

  def to_json
    to_hash.to_json
  end

  def to_hash
    { :name => name, :postcode => postcode, :area => area }
  end

  private
  def parse_parameters params
    self.name = params[0]
    self.postcode = params[1].to_i
    self.area = params[2]
  end

end
