# Cyprus Street Names
[![Build Status](https://secure.travis-ci.org/despo/cyprus-street-names.png)](http://travis-ci.org/despo/cyprus-street-names) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/despo/cyprus-street-names)

#### Data from [Cyprus Postal Services]

## Usage

### Finding streets

`require 'street_names'`

```ruby
street_finder = StreetNames::Finder.new

street_finder.find_by_postcode 8020
street_finder.find_by_name "Demosthenous Georgiou"
street_finder.find_by_area "Pafos"
```
#### Search στα Ελληνικά

```ruby
street_finder = StreetNames::Finder.new "gr" # load greek datastore

street_finder.find_by_postcode 8020
street_finder.find_by_name "Δημοσθένους Γεωργίου"
street_finder.find_by_area "Πάφος"
```

**Note:** you may need to add `#encoding: utf-8` to the top of your file when searching using Greek characters

## License

Licensed under the [MIT] Licence

[MIT]:https://raw.github.com/despo/cyprus-street-names/master/MIT-LICENSE.txt
[Cyprus Postal Services]:http://www.mcw.gov.cy/mcw/dps/dps.nsf/index_en/index_en?opendocument
