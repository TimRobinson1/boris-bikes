require './lib/bike'
require './lib/van'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :broken_bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes, @broken_bikes = [], []
    @capacity = capacity
    invalid_capacity?
  end

  def release_bike
    raise 'no bikes' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'station full' if full?
    bike.broken? ? @broken_bikes << bike : @bikes << bike
  end

  def load_van
    raise 'no broken bikes' if no_broken_bikes?
    @broken_bikes.pop
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def no_broken_bikes?
    @broken_bikes.empty?
  end

  def invalid_capacity?
    raise 'invalid capacity' if @capacity <= 0
  end
end
