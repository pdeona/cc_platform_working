require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  def setup
    @t = Transaction.new
  end

  test "it creates a Transaction on .new" do
    assert_instance_of Transaction, @t, "Object not an instance of Transaction"
  end

  test "Transaction has a .date method" do
    assert_respond_to @t, :date, "Transaction has no .date method"
  end

  test "Transaction has a .position_taken method" do
    assert_respond_to @t, :position_taken, "Transaction has no .position_taken method"
  end

  test "Transaction has a .underlying_currency method" do
    assert_respond_to @t, :underlying_currency, "Transaction has no .underlying_currency method"
  end

  test "Transaction has a .exchanged_currency method" do
    assert_respond_to @t, :exchanged_currency, "Transaction has no .exchanged_currency method"
  end

  # test "Transaction has a .position method"

  test "The date attribute only accepts accepted formats" do
    @t.date = 'invalid'
    refute @t.save, "transaction was saved with invalid date"
  end
  test "The exchanged_currency attribute validates symbol length"
  test "The underlying_currency attribute validates symbol length"
  test "The exchanged_currency attribute validates symbol matches an existing currency"
  test "The underlying_currency attribute validates symbol matches an existing currency"


end
