#time_segment
TimeSegment is a substitute of DateHelper distance_of_time_in_words and makes your time more readable.

## Installation
Add this line to your rails's Gemfile:

    gem 'time_segment'

And then execute:

    $ bundle install

## Conventions
According rules of leap year,  year and month, respectively, has been given an average value.

    1 year = 365.2425 days
    1 month = 30.436875 days
    
You'll get some strange results when your time segment include Feruary or a leap year. For example:

    "2 months" == TimeSegment.new(Time.new(2013,12,12,12,12,12),Time.new(2014,3,12,12,12,12))

## Usage
    TimeSegment(Time.now,29.days.ago).round => "29 days"
    TimeSegment(Time.now,43.days.ago).round => "1 month"
    TimeSegment(Time.now,367.days.ago).round => "about 1 year"
    blog.created_at.time_segment_to_now.round


    TimeSegment(Time.now,29.days.ago).in_days => 29
    TimeSegment(Time.now,29.days.ago).in_months => 0
    TimeSegment(Time.now,43.days.ago).in_days => 43
    TimeSegment(Time.now,43.days.ago).in_months => 1
    TimeSegment(Time.now,367.days.ago).in_years => 1
    TimeSegment(Time.now,364.days.ago).in_years => 0


    ts = TimeSegment.new(Time.new(2013,1,2,3,4,5),Time.new(2014,2,3,4,5,6))
    ts.years => 1
    ts.months => 1
    ts.days => 1
    ts.hours => 8
    ts.minutes => 42
    ts.seconds => 43

    ts.include? Time.new(2013,2,3,4,5,6) => true
    ts.include? Time.new(2015,2,3,4,5,6) => false

## Contribution
    Fork it
    Create your feature branch (git checkout -b my-new-feature)
    Commit your changes (git commit -am 'Added some feature')
    Push to the branch (git push origin my-new-feature)
    Create new Pull Request

## :)
