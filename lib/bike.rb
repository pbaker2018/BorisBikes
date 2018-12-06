require_relative 'docking_station'

class Bike

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report_broken
    @working = false
  end

  def broken?
    !@working
  end

end

bike = Bike.new
p bike.working?
p bike.broken?
