require './lib/bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    invalid_capacity?
  end

  def release_bike
    raise 'no bikes' if empty?
    if @bikes[-1].broken?
      @bikes.pop
      'this bike is broken'
    else
      @bikes.pop
    end
  end

  def dock(bike)
    raise 'station full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def invalid_capacity?
    raise 'invalid capacity' if @capacity <= 0
  end
end
