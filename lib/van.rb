class Van
  attr_reader :cargo
  DEFAULT_CAPACITY = 20

  def initialize
    @cargo = []
  end

  def collect_bike(bike)
    raise 'van full' if full?
    @cargo << bike
  end

  def deliver_bike
    raise 'van is empty' if empty?
    @cargo.pop
  end

  private

  def full?
    @cargo.length >= DEFAULT_CAPACITY
  end

  def empty?
    @cargo.empty?
  end
end
