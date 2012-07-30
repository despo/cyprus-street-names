require 'street'

class SpreadsheetParser
  def self.load locale="en"
    Spreadsheet.open("./data/cyprus_postcode_dir_#{locale}.xls") do |spreadsheet|
      worksheet = spreadsheet.worksheets[8]
      worksheet.map { |parameters| Street.new parameters }
    end
  end

end
