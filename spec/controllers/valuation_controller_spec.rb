require 'rails_helper'

RSpec.describe ValuationsController, type: :controller do

  describe "show" do
    let(:bitcoinQuantity) { 5 }
    
    it "returns http success" do
      get 'show', params: { :bitcoinQuantity => bitcoinQuantity }, xhr: true
      expect(response).to have_http_status(:success)
    end
    
    it 'renders the correct javascript' do
      get 'show', params: { :bitcoinQuantity => bitcoinQuantity }, xhr: true
      expect(response).to render_template('valuations/show')
    end
  end
end