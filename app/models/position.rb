class Position
  include Mongoid::Document
  embeds_one :currency
  belongs_to :user
  has_many :transactions

end
