# trainline-scraper

This simple Ruby app uses `trainline` internal API to fetch trains departures data from [trainline.com](https://www.thetrainline.com/)

#### ```Trainline::Api::Location```
* Usage `Trainline::Api::Location.new(search_term: "STATION_NAME")`
* Queries `/api/locations-search/v2/search` endpoint
* Returns response from api
Example result
```JSON
irb(main):001> Trainline::Api::Location.new(search_term: "London").body
=>
{
  "searchLocations": [
    {
      "name": "London",
      "countryCode": "GB",
      "code": "urn:trainline:generic:loc:182gb",
      "score": 1,
      "extraInfo": {
        "subtitle": "Any",
        "attributes": [
          "BusStation"
        ]
      },
      "locationType": "stationGroup",
      "defaultLanguage": "en",
      "timezone": "Europe/London",
      "connections": [
        "urn:trainline:connection:atoc",
        "urn:trainline:connection:distribusion",
        "urn:trainline:connection:pao_sncf"
      ]
    },
```

#### ```Trainline::Api::JourneySearch``` (WIP)
* Usage `Trainline::Api::JourneySearch.new(departure:, destination:, depart_at: DateTime.parse("2023-11-06 13:00:00")).post`
* Queries `/api/journey-search` endpoint
```JSON
irb(main):001> Trainline::Api::JourneySearch.new.body
{
  "data": {
    "journeySearch": {
      "passengers": {
        "76f5ce86-6318-4d10-bb72-6779600357c9": {
          "id": "76f5ce86-6318-4d10-bb72-6779600357c9",
          "dateOfBirth": "2005-11-15T00:00:00"
        }
      },
      "journeys": {
        "journey-3062599b-0a11-414c-87dd-dc587889fa34": {
          "sections": [
            "section-8674f464-d1b4-4206-8463-3c51ec697907"
          ],
          "id": "journey-3062599b-0a11-414c-87dd-dc587889fa34",
          "direction": "outward",
          "legs": [
            "leg-d6b64c50-e08a-4f17-942f-830459bf4f5e"
          ],
```

### Requirements
* Ruby 3.2.2

### Setup
```
bundle install
```

### Use
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

### Test data

```
London urn:trainline:generic:loc:182gb
Paris urn:trainline:generic:loc:4916
```
