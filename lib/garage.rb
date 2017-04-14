class Garage

  def initialize
    @bikes = []
  end

  def receive_bike(bike)
    @bikes << bike
  end
end
