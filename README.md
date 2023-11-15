# trainline-scraper

This simple Ruby app uses `trainline` internal API to fetch trains departures data from [trainline.com](https://www.thetrainline.com/)

#### ```Trainline::Api::Location```
* Usage `Trainline::Api::Location.new(search_term: "STATION_NAME")`
* Queries `/api/locations-search/v2/search` endpoint
* Returns result which station name matches `STATION_NAME` search term
* `code` attribute in result could be used to query next endpoint `journey-search` to fetch trains data as a `destination_id` and/or `departure_id`
Example result
```ruby
irb(main):001> Trainline::Api::Location.new(search_term: "London").get
=>
{"name"=>"London",
 "countryCode"=>"GB",
 "code"=>"urn:trainline:generic:loc:182gb",
 "score"=>1,
 "extraInfo"=>{"subtitle"=>"Any", "attributes"=>["BusStation"]},
 "locationType"=>"stationGroup",
 "defaultLanguage"=>"en",
 "timezone"=>"Europe/London",
 "connections"=>["urn:trainline:connection:atoc", "urn:trainline:connection:distribusion", "urn:trainline:connection:pao_sncf"]}
```

#### ```Trainline::Api::JourneySearch``` (WIP)
* Usage `Trainline::Api::JourneySearch.new(departure_id: DEPARTURE_CODE, destination_id: DESTINATION_CODE, depart_at: DateTime.parse("2023-11-06 13:00:00")).post`
* Queries `/api/journey-search` endpoint
```ruby
irb(main):001> Trainline::Api::JourneySearch.new.post
...
### currently this query is blocked by Cloudfront
Here's response
=>
{"url"=>
  "https://geo.captcha-delivery.com/captcha/?initialCid=AHrlqAAAAAMAmUVstrm7to0ATj4tIA==&cid=vr~jxw2Tyy_Y6BlIwb_CgPTYqdv8oSttFivr73ZB_9JQ0e8r7WghiJPtNZSi~xD36XXpG2Q7TlqR3vtmCqhsbnc0aTHx3X7Hcwmla~EqMqyKiVAODcV7P2L1h0vlc3jm&referer=https%3A%2F%2Fwww.thetrainline.com%2Fapi%2Fjourney-search&hash=E1950F58FF4C3B67C237DE42A4D080&t=bv&s=41886&e=9d9738c17007af65e9ac9dbc79c50f7ca85e60e056ebaadea5a249ed56f1f36a"}
```

### Requirements
* Ruby 3.2.2

### Setup
```
bundle install
```

### Use (WIP)
```
➜  lp git:(main) irb
irb(main):001> ComThetrainline.find("London", "Paris", DateTime.parse("2023-11-06 13:00:00"))
# [Trains Segments]
```

### Testing
To run all tests use
```
bundle exec rspec
```

### Test data (WIP)

```
London urn:trainline:generic:loc:182gb
Paris urn:trainline:generic:loc:4916
```
