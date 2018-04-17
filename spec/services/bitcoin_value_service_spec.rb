require 'rails_helper'

RSpec.describe BitcoinValueService do
  it 'makes a request for the information' do
    stub_request(:get, "https://blockchain.info/ticker").
         with(  headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.14.0'
           }).
         to_return(status: 200, body: '{ "USD" : {"15m" : 478.68, "last" : 478.68, "buy" : 478.55, "sell" : 478.68,  "symbol" : "$"} }', headers: {})

    described_class.new(desired_currency: 'USD').value

    expect(a_request(:get, "https://blockchain.info/ticker")).to have_been_made.once
  end
end