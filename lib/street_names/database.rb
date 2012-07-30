require "pstore"

module StreetNames
  class  Database

    def load_streets data=nil
      datastore.transaction { data = datastore[:streets] }
    end

    def save! data
      datastore.transaction { datastore[:streets] = data[:streets] }
    end

    private
    def datastore
      @datastore ||= PStore.new(path)
    end

    def path
      "./data/street_names.dat"
    end

  end
end
