require 'rails_helper'

describe 'Bitcoin Valuation', type: :request do
  
    let(:bitcoinQuantity) { 5 }
    
    before do
      stub_request(:get, "https://blockchain.info/ticker").
         with(  headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.14.0'
           }).
         to_return(status: 200, body: '{ "USD" : {"15m" : 478.68, "last" : 478.68, "buy" : 478.55, "sell" : 478.68,  "symbol" : "$"} }', headers: {})
    end
    
    it "returns http success" do
      get '/valuation', params: { :bitcoinQuantity => bitcoinQuantity }, xhr: true
    
      expect(response).to have_http_status(:success)
    end
    
    it 'renders the correct javascript' do
      get '/valuation', params: { :bitcoinQuantity => bitcoinQuantity }, xhr: true
      expect(response).to render_template('valuations/show')
    end
end