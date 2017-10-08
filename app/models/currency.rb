class Currency
  include Mongoid::Document
  field :cur_name
  field :value, type: BigDecimal
  field :symbol

  validates :symbol, length: { minimum: 3, maximum: 5 }

  ACCEPTED_CURRENCIES = ["BTC", "BCH", "ETH", "ETC", "LTC",
                         "DSH", "XMP", "ZEC", "XRP", "USD",
                         "EUR", "JPY", "GBP", "CHF", "CAD",
                         "AUD", "NZD", "ZAR", "CNY"]

  validates_inclusion_of :symbol, in: ACCEPTED_CURRENCIES

end
