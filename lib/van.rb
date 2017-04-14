class Van
  attr_reader :cargo
  def initialize
    @cargo = []
  end

  def collect_broken_bike(bike)
    raise 'van full' if full?
    @cargo << bike
  end

  private

  def full?
    @cargo.length >= 20
  end
end
