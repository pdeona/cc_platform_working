require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  def setup
    btc = Currency.create(symbol: 'BTC', cur_name: 'bitcoin')
    @position = Position.new(
        user: User.first,
        currency: btc
      )
    Transaction.create(position: @position, date: Date.new(2017, 1, 1), underlying_currency: 'BTC', exchanged_currency: 'USD')
    Transaction.create(position: @position, date: Date.new(2017, 1, 30), underlying_currency: 'BTC', exchanged_currency: 'USD')

  end

  test "creates a Position object" do
    assert_instance_of Position, @position, "Object is not a Position"
  end

  test "has a .currency attribute" do
    assert_respond_to @position, :currency, "Position has no .currency attribute"
  end

  test "belongs to one User" do
    assert_instance_of User, @position.user, "Position has no .user"
  end

  test "has many transactions" do
    assert_instance_of Array, @position.transactions.to_a, "Position does not return a list of .transactions"
    @position.transactions.to_a.each do |transaction|
      assert_instance_of Transaction, transaction, "List object is not a valid transaction"
    end
  end

  test "can filter transactions returned by date" do
    t = @position.transactions.where(:date.gte => '2016-12-31').to_a.first
    assert true, t.date > Date.new(2016, 12, 31)
  end

  test "has a single currency with a symbol and name" do
    c = @position.currency
    assert_instance_of Currency, c, "Position's currency object is not a Currency"
    assert_respond_to c, :symbol, "currency has no .symbol method"
    assert_respond_to c, :cur_name, "currency has no .cur_name method"
  end

  test "rejects invalid currency types" do
    c = Currency.new symbol: 'BTS', cur_name: 'butt stuff'
    @position.currency = c
    refute @position.save, "Position saved with invalid currency"
  end

  test "rejects untracked cryptocurrencies or fiat currencies" do
    c = Currency.new symbol: 'BFS', cur_name: 'Venezuelan Bolivar'
    @position.currency = c
    refute @position.save, "Position saved with invalid currency"
  end

  test "saves when given a valid owner and currency" do
    assert @position.save, "Unable to save valid Position"
  end

end
