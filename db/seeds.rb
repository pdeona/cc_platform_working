
Currency::ACCEPTED_CURRENCIES.each do |sym|
  Currency.create!(symbol: sym, cur_name: sym)
end
