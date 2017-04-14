require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }

  let(:station) { double :dockingstation }

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to :dock }

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'can have a larger capacity' do
    expect(subject.capacity).to eq 20
  end

  # it 'can have a smaller capacity' do
  #   station = double(:dockingstation(10))
  #   expect(station.capacity).to eq 10
  # end

  # it 'raises error when given zero capacity' do
  #   expect{ double(:dockingstation(0)) }.to raise_error 'invalid capacity'
  # end
  #
  # it 'raises error when given negative capacity' do
  #   expect{ double(:dockingstation -3 ) }.to raise_error 'invalid capacity'
  # end

  it 'gets a bike object' do
    allow(bike).to receive(:broken?).and_return(false)
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'gets a working bike' do
    allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:broken?).and_return(false)
    subject.dock bike
    released_bike = subject.release_bike
    expect(released_bike.working?).to eq true
  end

it 'releases working bikes' do
  allow(bike).to receive(:working?).and_return(true)
  allow(bike).to receive(:broken?).and_return(false)
  subject.dock(bike)
  released_bike = subject.release_bike
  expect(released_bike).to be_working
end

  it 'shows docked bikes' do
    subject.dock bike
    expect(subject.bikes).to eq [bike]
  end

  describe '#dock' do
    it 'docks bikes' do
      expect(subject.dock bike).to eq [bike]
    end

    it 'raises error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock( double(:bike) ) }
      expect { subject.dock( double(:bike) ) }.to raise_error 'station full'
    end

    it 'accepts broken bikes' do
      allow(bike).to receive(:report_broken).and_return(true)
      bike.report_broken
      expect(subject.dock bike).to eq [bike]
    end
  end

  describe '#release_bike' do
    it 'raises error when empty' do
      expect { subject.release_bike }.to raise_error 'no bikes'
    end

    it 'releases bikes as single object' do
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end

    it 'does not release broken bikes' do
      allow(bike).to receive(:report_broken).and_return(true)
      allow(bike).to receive(:broken?).and_return(true)
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike).to eq 'this bike is broken'
    end
  end

end
