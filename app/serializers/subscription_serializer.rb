class SubscriptionSerializer
  include JSONAPI::Serializer 

  attributes :title
  attributes :price
  attributes :frequency
  attributes :sub_status

end