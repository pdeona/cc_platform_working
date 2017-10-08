Currency.create(cur_name: 'US Dollar', symbol: 'USD')
Currency.create(cur_name: 'Euro', symbol: 'EUR')
Currency.create(cur_name: 'Japanese Yen', symbol: 'JPY')
Currency.create(cur_name: 'British Pound', symbol: 'GBP')
Currency.create(cur_name: 'Swiss Franc', symbol: 'CHF')
Currency.create(cur_name: 'Canadian Dollar', symbol: 'CAD')
Currency.create(cur_name: 'Australian Dollar', symbol: 'AUD')
Currency.create(cur_name: 'New Zealand Dollar', symbol: 'NZD')
Currency.create(cur_name: 'South African Rand', symbol: 'ZAR')
Currency.create(cur_name: 'Chinese Yuan Renminbi', symbol: 'CNY')
Currency.create(cur_name: 'bitcoin', symbol: 'BTC')
Currency.create(cur_name: 'bitcoin-cash', symbol: 'BCH')
Currency.create(cur_name: 'ethereum', symbol: 'ETH')
Currency.create(cur_name: 'ethereum-classic', symbol: 'ETC')
Currency.create(cur_name: 'litecoin', symbol: 'LTC')
Currency.create(cur_name: 'dash', symbol: 'DASH')
Currency.create(cur_name: 'monero', symbol: 'XMR')
Currency.create(cur_name: 'zcash', symbol: 'ZEC')
Currency.create(cur_name: 'ripple', symbol: 'XRP')


User.create(username: 'pedro@de.ona', password: 'lolcoin', password_confirmation: 'lolcoin')

u = User.last
c = Currency.first
p = Position.create({
			user: u,
	 		currency: c
	 	})

Transaction.create(position: p, date: Date.new(2017, 1, 1), underlying_currency: 'BTC', exchanged_currency: 'USD')
Transaction.create(position: p, date: Date.new(2017, 1, 30), underlying_currency: 'BTC', exchanged_currency: 'USD')

