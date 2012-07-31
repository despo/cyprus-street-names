require "pstore"

module StreetNames
  class  Database

    def initialize locale=LOCALE
      @locale = locale
    end

    def load_streets data=nil
      datastore.transaction { data = datastore[:"streets_#{@locale}"] }
    end

    def save! data
      datastore.transaction { datastore[:"streets_#{@locale}"] = data[:streets] }
    end

    private
    def datastore
      @datastore ||= PStore.new(path)
    end

    def path
      File.join(File.dirname(__FILE__), "..", "..", "data", "street_names_#{@locale}.dat")
    end

  end
end
