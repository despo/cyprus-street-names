require 'street'
module StreetNames

  class Parser

    attr_reader :streets

    def load_cities locale="en"
      Spreadsheet.open("./data/cyprus_postcode_dir_#{locale}.xls") do |spreadsheet|
        @streets ||= CITIES.each_value.map do |city|
          spreadsheet.worksheets[city].map {|parameters| Street.new parameters }
        end.inject(:+)
      end
    end

    def find_by_postcode postcode
      @streets.select { |street| street.postcode == postcode }
    end

    def find_by_street_name street_name
      @streets.select { |street| street.name == street_name }
    end

  end

  CITIES = { :paphos =>  8, :larnaca => 7, :limassol => 6, :lefkosia => 5 }
end
