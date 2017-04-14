require './lib/garage.rb'

describe Garage do

  let(:bike) { double :bike, :broken? => false }
  let(:bad_bike) { double :bike, :broken? => true }

  it { is_expected.to respond_to :receive_bike }

  describe '#receive_bikes' do
    it 'takes bikes from van' do
      expect(subject.receive_bike(bad_bike)).to eq [bad_bike]
    end
  end

end
