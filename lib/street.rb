require 'json'

class Street
  attr_reader :name, :postcode, :area

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
    @name = params[0]
    @postcode = params[1].to_i
    @area = params[2]
  end

end
