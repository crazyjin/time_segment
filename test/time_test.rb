require 'test/unit'
require 'time_segment'
require 'time_segment/core_ext'

class TestTime < Test::Unit::TestCase
  def test_time_segment_to_now
    t = Time.now
    assert_equal true, t.respond_to?(:time_segment_to_now)
  end

  def test_time_segment_to
    t = Time.now
    assert_equal true, t.respond_to?(:time_segment_to)
  end
end
