require 'rubygems'
require "active_support/all"

class TimeSegment
  DAY_IN_SEC = 86400
  MONTH_IN_SEC = 2629746
  YEAR_IN_SEC = 31556952

  attr_reader :years, :months, :days, :hours, :minutes, :seconds, :in_seconds

  def initialize from,to=nil
    to = Time.now if to.nil?

    from = from.to_time if from.respond_to?(:to_time)
    to = to.to_time if to.respond_to?(:to_time)

    if from > to
      @from, @to = to,from 
    else
      @from, @to = from,to
    end

    @in_seconds = (@to - @from).round.to_i

    @years,remainder = @in_seconds.divmod YEAR_IN_SEC
    @months, remainder = remainder.divmod MONTH_IN_SEC
    @days, remainder = remainder.divmod DAY_IN_SEC
    @hours, remainder = remainder.divmod 3600
    @minutes, remainder = remainder.divmod 60
    @seconds = remainder
  end

  def self.between(from, to)
    self.new(from,to)
  end

  def in_minutes
    @in_minutes = (@in_seconds/60) if @in_minutes.nil?
    @in_minutes
  end

  def in_hours
    @in_hours = (@in_seconds/3600) if @in_hours.nil?
    @in_hours
  end

  def in_days
    @in_days = (@in_seconds/86400) if @in_days.nil?
    @in_days
  end

  #1 month = 30.436875 days = 2629746 = 30.436875 * 86400 seconds
  def in_months
    @in_months = (@in_seconds/MONTH_IN_SEC) if @in_months.nil?
    @in_months
  end

  #1 year = 365.2425 days = 31556952 seconds
  def in_years
    @years
  end

  def include? time
    t = time.to_time if time.respond_to? :to_time

    if t and t >= @from and t <= @to then true
    else
      false
    end
  end
  
  def round options = {}
    options = { scope: :'datetime.distance_in_words' }.merge!(options)

    I18n.with_options :locale => options[:locale], :scope => options[:scope] do |i18n|
      if 0 < self.in_years then i18n.t :over_x_years, :count => @years
      elsif 0 < self.in_months then i18n.t :x_months, :count => @in_months
      elsif 0 < self.in_days then i18n.t :x_days, :count => @in_days
      elsif 0 < self.in_hours then i18n.t :about_x_hours, :count => @in_hours
      elsif 0 < self.in_minutes then i18n.t :x_minutes, :count => @in_minutes
      elsif 0 < self.in_seconds then i18n.t :x_seconds, :count => @in_seconds
      else i18n.t :less_than_x_seconds, :count => 1
      end
    end
  end
end

require 'time_segment/core_ext'
