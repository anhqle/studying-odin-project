class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
    @minutes = 0
    @hours = 0
  end

  def time_string
    hours = @seconds / 3600
    minutes = (@seconds - 3600 * hours) / 60
    seconds = @seconds - 3600 * hours - 60 * minutes
    return "%02d:%02d:%02d" % [hours, minutes, seconds]
  end
end