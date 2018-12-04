require_relative 'docking_station'

class Bike

  def working?
    true
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

end
