class Position
  include Mongoid::Document
  embeds_one :currency
  belongs_to :user
  embeds_many :transactions

  def self.transaction_filter_by date: {}, currency_exchanged: false
    if date['before'] && date['after']
      transactions.where{ |date| date['before'] < date < date['after'] }
    end
  end

end
