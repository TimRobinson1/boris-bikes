require "docking_station.rb"

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  # Checking that you can dock bikes
  it {is_expected.to respond_to(:dock)}

  # Checking that it will return docked bikes when viewed.
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises an error if there are no bikes' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises an error if station is full when docking' do
    20.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error 'Station full'
  end
end


# a) gets a bike
# b) expects bike to be working
