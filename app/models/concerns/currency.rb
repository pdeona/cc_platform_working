class Currency
  include Mongoid::Document
  field :cur_name
  field :value, type: BigDecimal
  field :symbol
end
