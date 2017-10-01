class Position
  include Mongoid::Document
  embeds_one :currency
  embeds_one :user
  has_many :transactions
end
