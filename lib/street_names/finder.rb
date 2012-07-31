module StreetNames
  class Finder
    attr_reader :streets

    def initialize locale=LOCALE
      @database = StreetNames::Database.new locale
      convert!
    end

    [ :postcode, :name, :area ].each do |key|
      define_method(:"find_by_#{key}") do |value|
        @streets.select { |street| eval("street.#{key}") == value }
      end
    end

    def all
      @streets
    end

    private

    def convert!
      @streets = @database.load_streets.map do |street|
        Street.new [ street[:name], street[:postcode], street[:area] ]
      end
    end


  end
end
