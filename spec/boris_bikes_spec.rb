require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it "Bike should be working" do
    bike = Bike.new
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  # it 'returns docked bikes' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   expect(subject.bikes).to eq [bike]
  #
  # end

  describe '#release_bike' do
    it 'raise error when no bikes'  do
      expect { subject.release_bike }.to raise_error  'no bikes'
    end

    it 'should not release broken bikes' do
      bike =  Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike).to eq 'bike is broken'
    end

  end

  describe '#dock' do
    it 'raise error when too many bikes' do
    subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock Bike.new }.to raise_error 'too many bikes'
    end

    it 'should dock broken bikes with broken tag' do
      bike = Bike.new
      bike.report_broken
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'should dock working bikes' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

  end
  it "should set capacity to 10 when given 10" do
  station = DockingStation.new(10)
  expect(station.capacity).to eq 10
  end

  it "should set default capacity to 20" do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike)}.to raise_error 'too many bikes'
    end
  end
end
