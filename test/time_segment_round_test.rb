require 'test/unit'
require 'time_segment'

I18n.load_path += ['./test/en.yml']
class TimeSegmentRoundTest < Test::Unit::TestCase
  def test_round_years
    from = Time.new(2012,10,7,14,31,12)
    to = Time.new(2014,2,10,17,01,06)
    ts = from.time_segment_to(to)
    assert_equal("over 1 year", ts.round(:locale => "en"))
  end

  def test_round_months
    ts = TimeSegment.new(Time.new(2013,12,12,12,12,12),Time.new(2014,3,12,12,12,12))
    #remember that: 1 month = 30.436875 days and Februay has only 28 days. so here is only 2 months
    assert_equal("2 months", ts.round)
    ts = TimeSegment.new(Time.new(2013,12,12,12,12,12),Time.new(2014,2,10,12,12,12))
    assert_equal("1 month", ts.round)
  end

  def test_round_days
    ts = TimeSegment.new(Time.new(2014,12,12,12,12,12),Time.new(2014,12,14,12,12,12))
    assert_equal("2 days", ts.round)
    ts = TimeSegment.new(Time.new(2014,12,12,12,12,12),Time.new(2014,12,13,12,12,12))
    assert_equal("1 day", ts.round)
  end

  def test_round_hours
    ts = TimeSegment.new(Time.new(2014,12,12,12,12,12),Time.new(2014,12,12,14,12,12))
    assert_equal("about 2 hours", ts.round)
    ts = TimeSegment.new(Time.new(2014,12,12,12,12,12),Time.new(2014,12,12,13,12,12))
    assert_equal("about 1 hour", ts.round)
  end
  
  def test_round_minutes
    ts = TimeSegment.new(Time.new(2014,12,12,12,12,12),Time.new(2014,12,12,12,14,12))
    assert_equal("2 minutes", ts.round)
    ts = TimeSegment.new(Time.new(2014,12,12,12,12,12),Time.new(2014,12,12,12,13,12))
    assert_equal("1 minute", ts.round)
  end

  def test_round_seconds
    ts = TimeSegment.new(Time.new(2014,12,12,12,12,12),Time.new(2014,12,12,12,12,14))
    assert_equal("2 seconds", ts.round)
    ts = TimeSegment.new(Time.new(2014,12,12,12,12,12),Time.new(2014,12,12,12,12,13))
    assert_equal("1 second", ts.round)
  end
end
