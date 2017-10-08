class Transaction
  include Mongoid::Document
  field :date, type: Date
  field :position_taken, type: BigDecimal
  field :underlying_currency
  field :exchanged_currency
  belongs_to :position

  validates :date, presence: true
  validates :underlying_currency, length: { minimum: 3, maximum: 5 }
  validates :exchanged_currency, length: { minimum: 3, maximum: 5 }

  validates_inclusion_of :exchanged_currency, in: Currency::ACCEPTED_CURRENCIES
  validates_inclusion_of :underlying_currency, in: Currency::ACCEPTED_CURRENCIES

 end
