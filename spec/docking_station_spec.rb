require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike, :broken? => false, :working? => true }
  let(:broken_bike) { double :bike, :broken? => true }

  let(:station) { double :dockingstation }
  let(:large_station) { double :dockingstation, :capacity => 30 }
  let(:small_station) { double :dockingstation, :capacity => 10 }

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :dock }
  it { is_expected.to respond_to :load_van }

  describe 'capacity' do

    it 'has a default value' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'can have a larger value' do
      expect(large_station.capacity).to eq 30
    end

    it 'can have a smaller value' do
      expect(small_station.capacity).to eq 10
    end

    it 'raises error when given zero' do
      expect{ DockingStation.new(0) }.to raise_error 'invalid capacity'
    end

    it 'raises error when given negative' do
      expect{ DockingStation.new(-3) }.to raise_error 'invalid capacity'
    end

  end

  describe '#load_van' do
    it 'produces broken bike' do
      subject.dock(broken_bike)
      expect(subject.load_van).to eq broken_bike
    end

    it 'raises error when loading no bikes' do
    expect{subject.load_van}.to raise_error 'no broken bikes'
    end
  end

  it 'gets a bike object' do
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'releases working bikes' do
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
      DockingStation::DEFAULT_CAPACITY.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error 'station full'
    end

    it 'accepts broken bikes' do
      expect(subject.dock broken_bike).to eq [broken_bike]
    end
  end

  describe '#release_bike' do
    it 'raises error when empty' do
      expect { subject.release_bike }.to raise_error 'no bikes'
    end

    it 'releases bikes as single object' do
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end
  end

end
