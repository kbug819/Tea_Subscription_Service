require 'rails_helper'

describe "subscribe endpoint" do
  it "creates a subscription based on information sent from front-end" do 
    post "/api/v1/subscribe"

    expect(response).to be_successful 
    subscription = JSON.parse(response.body, symbolize_names: true)
      
  end
end