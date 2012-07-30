require 'json'
require 'spreadsheet'

class Street
  attr_accessor :name, :postcode, :area

  def initialize params=nil
    parse_parameters(params) unless params.nil?
  end

  def to_json
    { :name => name, :postcode => postcode, :area => area }.to_json
  end

  private
  def parse_parameters params
    self.name = params[0]
    self.postcode = params[1].to_i
    self.area = params[2]
  end

end
