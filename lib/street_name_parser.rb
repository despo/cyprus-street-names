class StreetNameParser < SpreadsheetParser
  CITIES = { :paphos =>  8,
             :larnaca => 7,
             :limassol => 6,
             :lefkosia => 5,
             :rural_areas => 9 }

  def self.load locale="en", city="paphos"
    Spreadsheet.open("./data/cyprus_postcode_dir_#{locale}.xls") do |spreadsheet|
      return spreadsheet.worksheets[CITIES[city.to_sym]].map {|parameters| Street.new parameters }
    end
  end

  def self.find_by_postcode postcode=8020
    streets = StreetNameParser.load "en", "paphos"
    streets.select { |street| street.postcode == postcode }
  end

end
