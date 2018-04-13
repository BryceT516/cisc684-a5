require 'json'

  class BitcoinValueService
    def initialize(desired_currency: 'USD')
      @desired_currency = desired_currency
    end
    
    def value
      url = 'https://blockchain.info/ticker'
      response = JSON.parse((Faraday.get url).body)
      response[@desired_currency]['last'].to_f
    end
    
  end
