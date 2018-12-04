require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  # creating a constant of 20 that be accessed
  # in this class and in our test_spec
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
    @bikes.pop
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
