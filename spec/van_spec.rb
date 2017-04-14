require 'van'

describe Van do
  let(:bike) { double :bike, :broken? => false }
  let(:broken_bike) { double :bike, :broken? => true }

  it { is_expected.to respond_to :collect_bike}
  it { is_expected.to respond_to :deliver_bike}

  describe '#collect_bike' do
    it 'collects broken bike' do
      subject.collect_bike(broken_bike)
      expect(subject.cargo).to eq [broken_bike]
    end

    it 'collects working bike' do
      subject.collect_bike(bike)
      expect(subject.cargo).to eq [bike]
    end

    it 'raises error if full' do
      20.times { subject.collect_bike(broken_bike) }
      expect{ subject.collect_bike(broken_bike) }.to raise_error 'van full'
    end
  end

  describe '#deliver_bike' do
    it 'returns broken bike' do
      subject.collect_bike(broken_bike)
      expect(subject.deliver_bike).to eq broken_bike
    end

    it 'returns working bike' do
      subject.collect_bike(bike)
      expect(subject.deliver_bike).to eq bike
    end

    it 'raises error when empty' do
      expect { subject.deliver_bike }.to raise_error 'van is empty'
    end
  end
end
