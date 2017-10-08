class CurrenciesController < ApplicationController
  def index
  	@currencies = Currency.all.to_a
  end
end
