class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true
  validates :customer_id, presence: true
  validates :tea_id, presence: true
  belongs_to :customer
  belongs_to :tea
end