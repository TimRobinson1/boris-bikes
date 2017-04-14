require './lib/garage.rb'

describe Garage do

  let(:bike) { double :bike, :broken? => false }
  let(:bad_bike) { double :bike, :broken? => true}

  it { is_expected.to respond_to :receive_bike }
  it { is_expected.to respond_to :fix_bike }
  it { is_expected.to respond_to :return_bike }

  describe '#receive_bike' do
    it 'takes bikes from van' do
      expect(subject.receive_bike(bad_bike)).to eq [bad_bike]
    end
  end

  describe '#fix_bike' do
    it 'returns fixed bike' do
      broken_bike = Bike.new
      broken_bike.report_broken
      subject.receive_bike(broken_bike)
      subject.fix_bike
      expect(broken_bike.broken?).to eq false
    end

    it 'raises error with no bikes' do
      expect{ subject.fix_bike }.to raise_error 'no bikes to fix'
    end
  end

  describe '#return_bike' do
    it 'returns working bikes' do
      allow(bike).to receive(:broken=) { true }
      subject.receive_bike(bike)
      subject.fix_bike
      expect(subject.return_bike).to eq bike
    end

    it 'raises error if empty' do
      expect { subject.return_bike }.to raise_error 'no fixed bikes'
    end
  end

end
