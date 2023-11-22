require 'rails_helper'

describe "subscriptions update endpoint" do
  it "updates a description status" do 
    
    headers = {"CONTENT_TYPE" => "application/json"}
    customer_info = {
      first_name: "Mary",
      last_name: "Joseph",
      email: "mjoseph@gmail.com",
      address: "1234 W Maine"
    }

    post "/api/v1/customers", headers: headers, params: JSON.generate(customer_info)
    
    expect(response).to be_successful 
    customer = JSON.parse(response.body, symbolize_names: true)
    expect(customer[:data]).to be_a Hash
    expect(customer[:data][:id].to_i).to be_an Integer
    expect(customer[:data][:type]).to eq("customer")
    expect(customer[:data][:attributes]).to be_a Hash
    expect(customer[:data][:attributes][:first_name]).to eq("Mary")
    expect(customer[:data][:attributes][:last_name]).to eq("Joseph")
    expect(customer[:data][:attributes][:email]).to eq("mjoseph@gmail.com")
    expect(customer[:data][:attributes][:address]).to eq("1234 W Maine")
  end
end