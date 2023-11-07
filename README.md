# trainline-scraper

This simple Ruby app uses `trainline` internal api to fetch trains departures data from [trainline.com](https://www.thetrainline.com/)

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
