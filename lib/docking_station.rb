class DockingStation

DEFAULT_CAPACITY = 20

attr_reader :bikes, :capacity, :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'no bikes' if empty?
    if @bikes[-1].broken
      @bikes.pop
      'bike is broken'
    else
      @bikes.pop

    end
  end

  def dock(bike)
    fail 'too many bikes' if full?
    @bikes << bike
  end


  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
