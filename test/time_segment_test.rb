require 'test/unit'
require 'time_segment'

class TimeSegmentTest < Test::Unit::TestCase
  def setup
    @from = Time.new(2012,10,7,14,31,12)
    @to = Time.new(2014,2,10,17,01,06)

    @in_seconds = (@to - @from).round.to_i

    @ts = TimeSegment.new(@from,@to)
  end

  def test_in_years
    assert_equal(1,@ts.in_years)
  end

  def test_in_months
    assert_equal(16, @ts.in_months)
  end

  def test_in_days
    days = @in_seconds/86400
    assert_equal(days, @ts.in_days)
  end

  def test_in_hours
    hours = @in_seconds/3600
    assert_equal(hours, @ts.in_hours)
  end

  def test_in_minutes
    minutes = @in_seconds/60
    assert_equal(minutes, @ts.in_minutes)
  end

  def test_in_seconds
    assert_equal(@in_seconds, @ts.in_seconds)
  end

  def test_months_days_hours_minutes
    _,remainder = @in_seconds.divmod TimeSegment::YEAR_IN_SEC
    months, remainder = remainder.divmod TimeSegment::MONTH_IN_SEC
    days, remainder = remainder.divmod TimeSegment::DAY_IN_SEC
    hours, remainder = remainder.divmod 3600
    minutes, remainder = remainder.divmod 60

    assert_equal(months, @ts.months)
    assert_equal(days, @ts.days)
    assert_equal(hours, @ts.hours)
    assert_equal(minutes, @ts.minutes)
  end
end
