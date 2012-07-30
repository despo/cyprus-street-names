class StreetNameParser < SpreadsheetParser
  CITIES = [ 8, 7, 6, 5, 9 ]

    def self.load locale="en"
      Spreadsheet.open("./data/cyprus_postcode_dir_#{locale}.xls") do |spreadsheet|
        CITIES.map do |city|
          worksheet = spreadsheet.worksheets[city]
          return worksheet.map  {|parameters| Street.new parameters }
        end
      end
    end

end
