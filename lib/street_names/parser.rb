require 'spreadsheet'
module StreetNames
  class Parser

    attr_reader :streets

    def initialize locale=LOCALE
      @locale = locale
    end

    def load_cities
      @streets ||= CITIES.each_value.map do |city|
        spreadsheet.worksheets[city].map {|parameters| Street.new parameters }
      end.inject(:+)
    end

    def save!
      db = StreetNames::Database.new @locale
      db.save! :streets => @streets.map(&:to_hash)
    end

    private
    def spreadsheet
      @spreadsheet ||= Spreadsheet.open("./data/cyprus_postcode_dir_#{@locale}.xls")
    end

  end
end
