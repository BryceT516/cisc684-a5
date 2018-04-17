require 'rails_helper'

RSpec.describe ValuationsController, type: :controller do
  let(:bitcoin_pricer) { instance_double('BitcoinPricer') }
  let(:bitcoinQuantity) { 4 }
  
  before do
    allow(BitcoinPricer).to receive(:new).with(desired_currency: 'USD').and_return(bitcoin_pricer)
  end

  describe "show" do
    it "calls BitcoinPricer.value method" do
      expect(bitcoin_pricer).to receive(:value).with(bitcoinQuantity).once
      get 'show', params: { :bitcoinQuantity => bitcoinQuantity }, xhr: true
    end
  end
end