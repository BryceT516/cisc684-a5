class ValuationsController < ApplicationController
  def show
    pricer = BitcoinPricer.new(desired_currency: 'USD')
    
    @dollar_value = pricer.value(params['bitcoinQuantity'].to_f)
    
    respond_to do |format|
      format.html { redirect_to @home }
      format.js
    end
  end
end
