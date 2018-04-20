class BitcoinPricer
    def initialize(desired_currency: 'USD')
        @currency_type = desired_currency
    end
    
    def value(bitcoin_qty)
        # Use the Bitcoin Value Service to make the API call for the current value of Bitcoin
        bitcoin_service = BitcoinValueService.new(desired_currency: @currency_type)
        current_bitcoin_value = bitcoin_service.value * 2
        (current_bitcoin_value * bitcoin_qty).round(2)
    end
end