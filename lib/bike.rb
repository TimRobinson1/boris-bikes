class Bike
  attr_accessor :broken

  def initialize
    @broken = false
  end

  def working?
    !@broken
  end

  def broken?
    @broken
  end

  def report_broken
    @broken = true
  end
end
