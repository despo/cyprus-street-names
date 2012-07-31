# Cyprus Street Finder
[![Build Status](https://secure.travis-ci.org/despo/cyprus-paf.png)](http://travis-ci.org/despo/cyprus-paf) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/despo/cyprus-paf)

#### Data from ![Cyprus Postal Services] (http://www.mcw.gov.cy/mcw/dps/dps.nsf/index_en/index_en?opendocument)

## Usage

### Finding streets

```ruby
street_finder = StreetNames::Finder.new

street_finder.find_by_postcode postcode
street_finder.find_by_name "Demostheni Georgiou"
street_finder.find_by_area "Pafos"
```
#### Search στα Ελληνικά

```ruby
street_finder = StreetNames::Finder.new "gr" # or load in greek

street_finder.find_by_postcode 8020
street_finder.find_by_name "Δημοσθένους Γεωργίου"
street_finder.find_by_area "Πάφος"
```

**Note:** you may need to add *#encoding: utf-8* to the top of your file when searching using Greek characters

## License

[MIT]

[MIT]:https://raw.github.com/despo/cyprus-paf/master/MIT-LICENSE.txt
