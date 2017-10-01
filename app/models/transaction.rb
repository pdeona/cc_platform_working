class Transaction
  include Mongoid::Document
  field :date
  field :position_taken, type: BigDecimal
  field :underlying_currency
  field :exchanged_currency
  belongs_to :position

  validates :date, presence: true, format: {with:(/\d{4}\/\d{1,2}\/\d{1,2}/)}
  validates :underlying_currency, length: { minimum: 3, maximum: 5 }
  validates :exchanged_currency, length: { minimum: 3, maximum: 5 }

  ACCEPTED_CURRENCIES = ["BTC", "BCH", "ETH", "ETC", "LTC",
                         "DSH", "XMP", "ZEC", "XRP", "USD",
                         "EUR", "JPY", "GBP", "CHF", "CAD",
                         "AUD", "NZD", "ZAR", "CNY"]

  validates_inclusion_of :exchanged_currency, in: ACCEPTED_CURRENCIES
  validates_inclusion_of :underlying_currency, in: ACCEPTED_CURRENCIES

 end
