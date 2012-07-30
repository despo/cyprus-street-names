require 'street'
require 'street_names'
module StreetNames

  class Parser

    attr_reader :streets

    def initialize locale="en"
      @locale = locale
    end

    def load_cities
      @streets ||= CITIES.each_value.map do |city|
        spreadsheet.worksheets[city].map {|parameters| Street.new parameters }
      end.inject(:+)
    end

    [ :postcode, :name, :area ].each do |key|
      define_method(:"find_by_#{key}") do |value|
        @streets.select { |street| eval("street.#{key}") == value }
      end
    end

    def save!
      db = StreetNames::Database.new
      db.save! :streets => @streets.map(&:to_hash)
    end

    def load_from_pstore
      StreetNames::Database.new.load_streets
    end

    private
    def spreadsheet
      @spreadsheet ||= Spreadsheet.open("./data/cyprus_postcode_dir_#{@locale}.xls")
    end

  end

  CITIES = { :paphos =>  8, :larnaca => 7, :limassol => 6, :lefkosia => 5 }
end
