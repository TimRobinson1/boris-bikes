require 'bike'

describe Bike do
 it { is_expected.to respond_to :working?}
 it { is_expected.to respond_to :report_broken}


 describe "initialization" do
   it 'starts as working' do
     expect(subject.broken).to eq false
   end
 end

 describe "#report_broken" do
  it 'reports as broken' do
    expect(subject.report_broken).to eq true
  end
 end
end
