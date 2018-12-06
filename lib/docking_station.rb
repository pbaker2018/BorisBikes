require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
    bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    # don't return broken bikes
    bike = @bikes.pop
    if bike.broken?
      @bikes.pop
    else
      bike
    end
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
