Time.class_eval do 
  def time_segment_to_now
    self.time_segment_to Time.now
  end

  def time_segment_to to
    to = Time.now if to.nil?
    to = to.to_time if to.respond_to? :to_time

    TimeSegment.new(self,to)
  end
end
