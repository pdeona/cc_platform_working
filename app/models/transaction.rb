class Transaction
  include Mongoid::Document
  field :date
  field :position_taken, type: BigDecimal
  field :underlying_currency
  field :exchanged_currency
  belongs_to :position
end
