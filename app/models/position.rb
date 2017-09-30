class Position
  include Mongoid::Document
  embeds_one :currency
  embeds_one :user
  # field transactions:
end
