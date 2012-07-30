require 'street'

class SpreadsheetParser
  def self.load locale="en"
    Spreadsheet.open("./data/cyprus_postcode_dir_#{locale}.xls") do |spreadsheet|
      worksheet = spreadsheet.worksheets[8]
      streets = worksheet.map do |parameters|
        street = Street.new parameters
      end
    end
  end

end
