require 'bike'

describe Bike do

  let(:bike) { double :bike, :broken? => false }
  let(:broken_bike) { double :bike, :broken? => true }

  it { is_expected.to respond_to :working? }
  it { is_expected.to respond_to :report_broken }

  describe '#report_broken' do
    it 'reports broken bikes' do
      expect(broken_bike.broken?).to eq true
    end

    it 'returns false for working bikes' do
      expect(bike.broken?).to eq false
    end
  end

end
