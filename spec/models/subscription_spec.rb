require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "relationships" do
    it { should belong_to :tea}
    it { should belong_to :customer}
  end

  describe "validations" do
    it "should validate a subscription" do 
      tea = Tea.create!(title: "Blueberry", description: "A scrumptious evening tea", temperature: 208, brew_time: 15)
      customer = Customer.create!(first_name: "Jo", last_name: "Jackson", email: "jackson@gmail.com", address: "123 Main Ave")

      subscription = Subscription.create!(title: "#{tea.title}", price: 22.50, status: true, frequency: "3 months", customer: customer, tea: tea)
      expect(subscription).to validate_presence_of(:title)
      expect(subscription).to validate_presence_of(:price)
      expect(subscription).to validate_presence_of(:status)
      expect(subscription).to validate_presence_of(:frequency)
      expect(subscription).to validate_presence_of(:customer_id)
      expect(subscription).to validate_presence_of(:tea_id)
    end
  end
end