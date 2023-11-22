class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions), status: 200
  end
  def create
    tea = Tea.find(params[:tea_id])
    customer = Customer.find(params[:customer_id])
    require 'pry';binding.pry
    if customer && tea
      subscription = Subscription.create!(title: "#{tea.title} Subscription", price: tea.price, frequency: (params[:frequency]), tea: tea, customer: customer, sub_status: 1)
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
    end
  end

  def update
    subscription = Subscription.find(params[:subscription_id])
    if params[:subscription] == false
      subscription.update_columns(sub_status: 0)
      render json: SubscriptionSerializer.new(subscription), status: 200
    else
      subscription.update_columns(sub_status: 1)
      render json: SubscriptionSerializer.new(subscription), status: 200
    end
  end
end