require 'rails_helper'

describe "subscribe endpoint" do
  it "creates a subscription based on information sent from front-end" do 
    tea1 = Tea.create!(title: "Blueberry Green Tea", description: "A scrumptious evening tea", temperature: 208, brew_time: 15, price: 20.0)
    tea2 = Tea.create!(title: "Black Tea", description: "A scrumptious evening tea", temperature: 208, brew_time: 15, price: 20.0)
    customer = Customer.create!(first_name: "Jo", last_name: "Jackson", email: "jackson1@gmail.com", address: "123 Main Ave")
    headers = {"CONTENT_TYPE" => "application/json"}

    new_subscription = {
      tea_id: "#{tea1.id}",
      customer_id: "#{customer.id}",
      frequency: "3",
    }
    post "/api/v1/subscriptions", headers: headers, params: JSON.generate(new_subscription)
    expect(response).to be_successful 
    subscription = JSON.parse(response.body, symbolize_names: true)
    expect(subscription[:data]).to be_a Hash
    expect(subscription[:data][:id].to_i).to be_an Integer
    expect(subscription[:data][:type]).to eq("subscription")
    expect(subscription[:data][:attributes]).to be_a Hash
    expect(subscription[:data][:attributes][:title]).to eq("#{tea1.title} Subscription")
    expect(subscription[:data][:attributes][:sub_status]).to eq("Subscribed")
  end
end