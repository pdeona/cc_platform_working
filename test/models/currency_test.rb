require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase

  def setup
    @c = Currency.new(
            symbol: "BTC"
          )
  end

  test "it creates a Currency on Currency.new" do
    assert_instance_of Currency, @c, "Object not an instance of Currency"
  end

  test "Currency has a .cur_name method" do
    assert_respond_to @c, :cur_name, "Currency does not have a .cur_name method"
  end

  test "Currency has a .symbol method" do
    assert_respond_to @c, :symbol, "Currency does not have a .symbol method"
  end

  test "Currency validates symbol as existing currency" do
    @c.symbol = '123'
    refute @c.save, "symbol is not a valid currency"
  end

  test "Currency validates symbol length" do
    @c.symbol = 'invalid'
    refute @c.save, "symbol is not a valid length"
  end

end
