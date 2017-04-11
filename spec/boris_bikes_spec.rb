require "docking_station.rb"

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  it 'releases working bikes' do
    expect(subject.release_bike).to be_working
  end

  # Checking that you can dock bikes
  it {is_expected.to respond_to(:dock)}

  # Checking that it will return docked bikes when viewed.
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end


# a) gets a bike
# b) expects bike to be working
