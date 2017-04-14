require 'bike'

describe Bike do

  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :report_broken }

  let(:bike) { double :bike }

  describe '#report_broken' do
    it 'reports broken bikes' do
      allow(bike).to receive(:report_broken).and_return(true)
      allow(bike).to receive(:broken?).and_return(true)
      bike.report_broken
      expect(bike.broken?).to eq true
    end

    it 'returns false for working bikes' do
      allow(bike).to receive(:broken?).and_return(false)
      expect(bike.broken?).to eq false
    end
  end

end
