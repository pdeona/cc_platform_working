
module ApplicationHelper


  def get_coin_data(opts={})

    # uses coinmarketcap api to fetch data for coins in currency,
    # returns an array of object literals, one for each coin in our coins array
    # arguments (opts hash)
    #   :coins is an array of one or more strings, the name of the coin, default
    #     value is coins array below
    #   :currency is a string of one currency, default value "USD"
    # valid currencies:
    # "USD", "EUR", "JPY", "GBP", "CHF", "CAD", "AUD", "NZD", "ZAR", "CNY"

    # default
    coins = ["bitcoin", "bitcoin-cash", "ethereum", "ethereum-classic", "litecoin", "dash", "monero", "zcash", "ripple"]

    # set coins, currency
    coins = opts[:coins] || coins
    currency = opts[:currency] || "USD"

    endpoint = "https://api.coinmarketcap.com/v1/ticker/"  #bitcoin/?convert=EUR'
    url = endpoint + "/?convert=" + currency

    response = HTTParty.get(url).parsed_response
    result = []

    response.each do |item|
      # get coin data if the name is in our coins array
      result << item if coins.include? item["id"].downcase
    end

    return result
  end

end
