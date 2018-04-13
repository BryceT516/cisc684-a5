require 'rails_helper'

RSpec.describe BitcoinPricer do

  describe '#value' do
    let(:bitcoin_service) { instance_double('BitcoinValueService') }
    let(:bitcoin_quantity) { 4 }
    
    it 'makes the web service call for current bitcoin value' do
      allow(BitcoinValueService).to receive(:new).with(desired_currency: 'USD').and_return(bitcoin_service)
      allow(bitcoin_service).to receive(:value).and_return(10)
      
      
      expect(subject.value(bitcoin_quantity)).to eq(40)
      
    end
  end

end