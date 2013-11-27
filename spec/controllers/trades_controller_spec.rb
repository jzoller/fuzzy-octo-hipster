require 'spec_helper'

describe TradesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
  describe 'always_returns_true'do
  	it 'returns true' do
  		result = controller.always_returns_true
  		result.should eq(true)
  	end
  end

end
