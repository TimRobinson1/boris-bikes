class Garage

  def initialize
    @bikes = []
    @fixed_bikes = []
  end

  def receive_bike(bike)
    @bikes << bike
  end

  def fix_bike
    raise 'no bikes to fix' if empty?(@bikes)
    bike = @bikes.pop
    bike.broken = false
    @fixed_bikes << bike
  end

  def return_bike
    raise 'no fixed bikes' if empty?(@fixed_bikes)
    @fixed_bikes.pop
  end

  private

  def empty?(bikes)
    bikes.empty?
  end
end
