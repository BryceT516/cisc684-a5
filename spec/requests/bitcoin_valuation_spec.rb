require 'rails_helper'

describe 'Bitcoin Valuation', type: :request do
  
    let(:bitcoinQuantity) { 5 }
    
    it "returns http success" do
      get '/valuation', params: { :bitcoinQuantity => bitcoinQuantity }, xhr: true
    
      expect(response).to have_http_status(:success)
    end
end