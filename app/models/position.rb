class Position
  include Mongoid::Document
  embeds_one :currency
  embeds_one :user
  embeds_many :transactions



  def self.transaction_filter_by date: {}, currency_exchanged: false
    if date['before'] || date['after']
      transactions.where(date: { |d| date['before'] < d < date['after'] })
    end
  end

end
